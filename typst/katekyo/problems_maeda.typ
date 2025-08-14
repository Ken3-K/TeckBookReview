#import "@preview/physica:0.9.5": *
#import "../lib/document-boxes.typ": *
#set text(font: "Hiragino Kaku Gothic ProN", size: 12pt)
#set heading(numbering: "1.")

// Title
#let title(content) = {
  set align(center)
  set text(weight: "black", size: 1.5em)
  [#content]
}

#title([
  前田さんへの宿題
])

#problem([
  $sin theta + cos theta = 1/2$のとき、$cos theta sin theta$の値を求めよ
])

#problem([
  $
    tan theta + 1/ (tan theta ) = 1/ (sin theta cos theta)
  $
  を示せ。
])

#problem([
  $sin theta + cos theta = 1/sqrt(2)$のとき、
  $ 2 sin theta cos theta， sin 3theta + cos 3 theta $の値を求めよ。
])

#problem(
  [
    $cos pi / 12$の値を求めよ。
  ],
  [
    $tan 15^circle.small$の値を求めよ。

    (加法定理を使ってみよう。)
  ],
)

#problem([
  章末問題7の残りを解け。
])

