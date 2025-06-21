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
# open graph
# seoMeta:
#  ogImage: https://cover.sli.dev
---

# その余白、そのカラーコード、どうしてそうなったのか説明できますか？
## → デザインシステムを作ろう！

---

## どこもかしこも8px

- ボタンのパディングが**8px**
- アイコンとテキストの間隔が**8px**
- カード間のマージンも**8px**

---

## なぜ8pxが多いのか？

- **画面サイズの多様化**: どのデバイスでも見やすい比率
- **基数グリッドシステム**: 多くのUIコンポーネントで使いやすい最小単位
  - 8の倍数 (8, 16, 24, 32...) で要素を配置すると、全体の統一感が出やすい
- **直感的な分割**: 画面を効率的に分割しやすい

---

## 8pxに潜む課題

しかし、意識せずに使っていると...

- 「ここも8pxでいいか」という**安易な判断**
- 結果的に「なんとなく」の集まりになり**一貫性の欠如**
- デザイナーとエンジニア間での**認識のズレ**
- 新規メンバーが加わった際の**学習コスト増大**

---

## その「なんとなく」をなくすために
### → デザインシステムを導入しよう！

---

## デザインシステムとは？

- **デザインの原則**: ブランドの価値観や目指す体験を明文化
- **再利用可能なコンポーネント**: ボタン、入力欄、カードなどのUI要素
- **ガイドライン**: カラー、タイポグラフィ、スペーシングなどのルール
- **ツール**: デザインツールライブラリ、開発用コンポーネントライブラリ

---

## デザインシステム導入のメリット

- **一貫性の向上**: ブランドイメージとユーザー体験の統一
- **効率化**: デザイン・開発プロセスの高速化
- **品質向上**: UIの使いやすさ、アクセシビリティの向上
- **コラボレーション強化**: チーム間の認識共有と連携スムーズに

---

## 8pxとデザインシステム

デザインシステムがあれば、8pxも「なんとなく」ではなくなる

- **スペーシングの定義**: 8pxを基準とした明確なスペーシングスケール
- **コンポーネントの設計**: 8pxグリッドに基づいたコンポーネント定義
- **ドキュメント化**: なぜ8pxを使うのか、どこで使うのかを明文化

---

## 具体的にどうすればいいのか？

デジタル庁の取り組みが参考になります。
https://design.digital.go.jp/

<!-- 
https://design.digital.go.jp/foundations/spacing/#h2-%E4%BD%99%E7%99%BD%E3%83%AB%E3%83%BC%E3%83%AB%E3%81%AE%E4%BE%8B
-->

---

## まとめ

「いろんなところにある8px」は、デザインシステムによって

- **意図された8px**へ
- **統一された8px**へ
- **効率的な8px**へ

進化します。

---

## デザインシステムでより良いプロダクトを！

ご清聴ありがとうございました。
