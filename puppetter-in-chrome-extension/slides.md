---
# You can also start simply with 'default'
theme: seriph
# random image from a curated Unsplash collection by Anthony
# like them? see https://unsplash.com/collections/94734566/slidev
background: https://cover.sli.dev
# some information about your slides (markdown enabled)
title: Welcome to Slidev
info: |
  ## Slidev Starter Template
  Presentation slides for developers.

  Learn more at [Sli.dev](https://sli.dev)
# apply unocss classes to the current slide
class: text-center
# https://sli.dev/features/drawing
drawings:
  persist: false
# slide transition: https://sli.dev/guide/animations.html#slide-transitions
transition: slide-left
# enable MDC Syntax: https://sli.dev/features/mdc
mdc: true
# take snapshot for each slide in the overview
overviewSnapshots: true
---

# Chrome拡張でPuppeteerを使う

---

## Puppeteerの常識が覆った！

- これまで **Node.js** からでしか使えないと思っていた
- 実は、**Chrome 125以降** で拡張機能として利用可能！

---

## 必要条件

- **Chrome 125** 以降のバージョンが必須
- `playground.html` を利用してサンプルを試せる

---

## 実際に試した結果

- サンプルを実行する際には以下の手順
  1. `playground.html` をブラウザで開く
  2. サンプルコードを確認＆実行
- **簡単にPuppeteerを動かせた！**

---

## 注意点

- オリジナルのPuppeteerと比べると制約が多い
  - 例: **`eval()` によるエラー発生**
- セキュリティ面で制限が追加されている

---

## 実装してみた

<video controls>
  <source src="./sample.mp4" type="video/mp4">
</video>

---

## まとめ

- Chrome拡張でのPuppeteerは新たな可能性！
  - **Node.js不要** で利用可能
  - 制限があるものの、用途次第で大いに活用可能
- 今後の拡張機能開発に期待！


