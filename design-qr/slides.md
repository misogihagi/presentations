---
theme: seriph
background: https://cover.sli.dev
title: Welcome to Slidev
info: |
  ## Slidev Starter Template
  Presentation slides for developers.

  Learn more at [Sli.dev](https://sli.dev)
class: text-center
drawings:
  persist: false
transition: slide-left
mdc: true
overviewSnapshots: true
---

---
marp: true
theme: default
paginate: true
footer: "QRコード × Stable Diffusion | 作成方法解説"
---

# おしゃれなQRコードの作り方

最近流行りの「QRコードに絵を描く技術」を紹介します🎨  
自分だけのQRコードを作りましょう！

### 特徴
- 見た目がオシャレ✨
- QRコードとしてしっかり読み取れる！

> ※ 読み取る際は少し引き気味で撮影すると認識しやすいです。

---

## 使うツール：Stable Diffusion

画像生成AIモデル「**Stable Diffusion**」を活用します。

### 必要なもの
- 絵を生成するモデル  
  → 今回は**Counterfeit-V3.0**を使用。
- 拡張機能「ControlNet」  
  → QRコードをベースに絵を生成する。

モデルは以下から取得可能：
- [Hugging Face](https://huggingface.co/)
- [Civital](https://civitai.com/)

---

## モデルの導入手順

1. お好きなモデルを選びダウンロード。
   - Civitalではサンプル画像が見られるので便利！
2. ダウンロードしたモデルを次のフォルダに保存：  
   `stable-diffusion-webui/models/Stable-diffusion/`

> 詳しい手順は[こちらの記事](https://ikuriblog.com/how-to-put-a-model-in-stable-diffusion/)をご参照ください。

---

## ControlNetのインストール

### インストール手順
1. **Stable Diffusion**を開き、「Extensions」タブを選択。
2. 「Install from URL」に以下のURLを貼り付け：
   - ControlNetのURL  
3. 「Install」をクリック。
4. Extensionsタブの「Installed」→「Apply and restart UI」。

---

## ControlNet用モデルの追加

1. [ControlNet-v1-1](https://huggingface.co/lllyasviel/ControlNet-v1-1/tree/main)から  
   **control_v11f1e_sd15_tile.pth** をダウンロード。
2. ダウンロードしたファイルを次のフォルダに配置：  
   `stable-diffusion-webui/extensions/sd-webui-controlnet/models/`

> これで準備完了です！

---

## QRコード作成手順

### ① モデルの選択
- Stable Diffusionの画面上部「Stable Diffusion checkpoint」から選択。

### ② img2imgタブ
- プロンプト（生成したい絵の指示）を記入。
- QRコード画像をアップロード。

---

### ③ ControlNetの設定

- img2imgタブ下のControlNet設定を展開。
- QRコード画像をControlNetにもアップロード。

設定値を調整：
- Control Weight  
- Starting Control Step  
- Ending Control Step

---

## 実際の設定例

### img2img
- サイズ: 768x768  
- サンプリング: DPM++ 2M Karras  
- ステップ: 25  
- CFG Scale: 7  
- Denoising Strength: 0.85  

---

### ControlNet
- **Control Weight:** 1.75  
- **Starting Control Step:** 0.33  
- **Ending Control Step:** 1  

これらの設定でQRコードを生成できます！

---

## 生成のコツ

### 重要パラメータ
1. **Control Weight**  
   → QRコードの影響を調整（値が大きいほどQRコードが強調）。  
2. **Starting Control Step**  
   → QRコードをどのタイミングで反映するか。  

### 他の調整
- 「Denoising Strength」や「Sampling Steps」も調整可能。

---

## 参考例：Starting Control Stepの違い

- **0.1**  
  ![Starting Control Step: 0.1](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3125904/310b7eb3-b845-12b7-390f-fd404791638d.png)

- **1**  
  ![Starting Control Step: 1](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3125904/94e6c261-f627-0e66-7fe4-a8c1ff3e9304.png)

---

## まとめ

- **QRコード × 絵の融合**で、唯一無二のデザインを！
- 名刺やホームページ用QRコードに最適。

ぜひ試してみてください！

> 参考サイト：[Stable Diffusion Art](https://stable-diffusion-art.com/qr-code/)  

