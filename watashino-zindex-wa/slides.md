---
theme: seriph
layout: cover
---

# 私のZ-indexは53万です。ですがもちろんpopoverの前には来ませんからご心配なく

---

## 1. 従来のオーバーレイが抱える問題

---

### z-index 競合のジレンマ

- 数値の衝突: モーダル、ドロップダウン、ツールチップなどが混在すると、どの要素にどの z-index を割り当てるかという数値管理が複雑になりがちです。

```html
<div style="z-index: 10;">
  <div style="z-index: 100;">要素 A (z-index: 100)</div>
</div>
<div style="z-index: 20;">
  <div style="z-index: 50;">要素 B (z-index: 50)</div>
</div>
```

---

### スタッキングコンテキストの制限:

- 親要素に overflow: hidden や transform が設定されている場合、子要素の z-index がいくら高くても、親の範囲を超えて表示できない問題が発生する。

- 完全にページ最前面に表示させるための確実な方法がない。


---

#### 例

https://codepen.io/misogihagi/pen/gbrxOzM

1. 赤い背景の子要素 (z-index: 999) は、青い枠の親要素 (overflow: hidden) の右側と下側で切り取られて（クリッピングされて）表示されます。

2. 親要素の兄弟である緑色の要素 (z-index: 100) は、子要素よりも z-index が低いにもかかわらず、切り取られた赤い子要素の上に表示されます。

```html
<div style="
        position: relative;
        top: 0px; /* 親要素と位置を少し重ねるため */
        width: 250px;
        height: 80px;
        margin: 50px;
        padding: 10px;
        z-index: 100; /* 子要素(z-index: 999)よりも低い z-index */
        background-color: #4CAF50;
        color: white;
        border: 3px solid #387638;
    ">
        別の兄弟要素 (z-index: 100)
    </div>

    <div style="
        /* スタッキングコンテキストを生成するプロパティ */
        overflow: hidden; 
        /* または transform: translateX(0); */
        
        position: relative; /* 子要素の基準点とする */
        width: 200px;
        height: 150px;
        margin: 50px;
        padding: 10px;
        border: 3px solid #007bff;
        background-color: #e6f7ff;
    ">
        親要素 (overflow: hidden)
        
        <div style="
            position: absolute;
            /* 親要素の右側、下側に大きくはみ出すように配置 */
            top: 50px;
            left: 150px; 
            width: 150px;
            height: 100px;
            
            /* 別の兄弟要素よりもはるかに高い z-index を設定 */
            z-index: 999; 
            
            background-color: #ff4d4f;
            color: white;
            padding: 10px;
            border: 1px solid darkred;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        ">
            子要素 (z-index: 999)
        </div>
    </div>
```

---

## 2. Popover API の解決策：最上位レイヤー

---

## すべての z-index の上に

Popover APIの最大の特徴は、要素を **「Top layer (最上位レイヤー)」** に配置することにあります。

---

## Top layer (最上位レイヤー)とは？

ブラウザーが管理する、通常のDOM階層の外側にある特別なレイヤー。

Fullscreen、`<dialog>` 要素などが配置される場所です。

このレイヤーに配置された要素は、通常のDOMコンテンツのスタッキングコンテキスト（z-index）の影響を一切受けません。

つまり、通常のDOM要素がどんなに高い z-index: 99999 を持っていても、最上位レイヤーにあるポップオーバーには勝てません。

ちなみに、通常使われる論理的なレイヤーはスタッキングコンテキストと呼ばれます。最下位レイヤーはありません。

---

## 3. Top layer内のスタッキング順序の制御

Top Layer にある要素は、基本的にHTML要素に設定された $z$-index の値ではなく、以下のルールに従ってスタッキングされます。

---

### 1\. **挿入順序 (Last-in, First-out)**

最も基本的なルールは、**Top Layer に追加された要素が、その時点ですでに Top Layer にある要素よりも上に表示される**というものです。

  * これは「LIFO (Last-In, First-Out)」のスタッキング順序とも呼ばれます。
  * 例えば、最初に `popover` A が表示され、次に `popover` B が表示された場合、**B が A の上に表示されます**。

---

### 2\. **`showPopover()` メソッドの使用**

`popover` 属性を持つ要素は、`showPopover()` メソッドを使ってプログラム的に表示された場合、その呼び出しによって、その要素を Top Layer の**最前面**に移動させることができます。

もし、すでに表示されている `popover` A を、後から表示された `popover` B の前に出したい場合は、**A に対して再度 `A.showPopover()` を呼び出します**。

  * この操作により、A が Top Layer の最上位に再挿入され、B よりも前に出て表示されます。

---

### 3\. **`dialog.showModal()` の優先**

`<dialog>` 要素を `showModal()` メソッドで表示した場合、そのダイアログは Top Layer の中で**最も優先度が高く**、他の通常の `popover` 要素よりも上に表示されます。

-----

## 💡 コード例：`showPopover()` による順序の入れ替え

以下の例では、最初に表示した `popover` を、ボタンクリックで再度前面に移動させています。

```html
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>Popover Stacking</title>
    <style>
        .popover-content {
            border: 2px solid #333;
            padding: 15px;
            width: 200px;
            position: fixed;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

    <button onclick="popoverA.showPopover(); popoverB.showPopover();">
        A、Bの順で表示 (Bが上になる)
    </button>
    <button onclick="popoverA.showPopover()">
        Popver Aを前面に出す
    </button>

    <div id="popoverA" popover class="popover-content" style="top: 50px; left: 50px; background-color: #e6f7ff; border-color: blue;">
        <h3>Popover A</h3>
        <p>これを前面に出したい</p>
    </div>

    <div id="popoverB" popover class="popover-content" style="top: 100px; left: 100px; background-color: #fff0e6; border-color: orange;">
        <h3>Popover B</h3>
        <p>後から表示された要素</p>
    </div>

</body>
</html>
```

この例では、「Popover Aを前面に出す」ボタンをクリックするたびに、すでに表示されている `popoverB` の**上に** `popoverA` が再配置されます。

---

## まとめ

- Popover APIによりz-indexの制約から解消されます。
- 一方、スタックコンテキストなど考えることは多く、どれを前にするかを考えなくなったというわけではありません。
- それでもツールチップ、ドロップダウンメニュー、トースト通知などの一時的なUI（ポップオーバー）を、ほとんど、または全く JavaScript を書かずに実装できるようになりました。
- また、表示・非表示時のフォーカス管理やARIA属性の設定をブラウザ側で自動でやってくれます。

→　**Popover API使おう！**
