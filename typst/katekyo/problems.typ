#import "@preview/physica:0.9.5": *
#set text(font: "Hiragino Kaku Gothic ProN", size: 12pt)
#set heading(numbering: "1.")

// Title
#let title(content) = {
  set align(center)
  set text(weight: "black", size: 2em)
  [#content]
}
#set page(numbering: "1")
#set heading(numbering: "1.")
#set math.equation(numbering: "(1)")

#title("2025/07/24の宿題")

= 次の関数を$x$で微分しなさい: 
1. $x^3$
2. $x e^x$
3. $x log x$
4. $sin x$
5. $cos x$
6. $tan x$
7. $log(3x^2 + 4)$
8. $log(sin x)$


= 次の関数を$x$で積分しなさい
1. $1 / (3x + 2)$
2. $log x$
4. $x e^x$
5. $tan x$
6. $(6x)/(3x^2 + 4)$
7. $(cos x) / (sin x)$ 
8. $1/sqrt(a^2 - x^2)$

8.は$x = a sin t$とおくと計算できます。やってみて下さい。

= 半径$r$の球の体積を積分を使って求めよ。
答えは$4/3 pi r^3$となるのはおそらく皆さんご承知の通りですね。しかし求めようとすると結構手間取ります。

複数の求め方があるけれど、どれも微小要素を足し合わせていくことで求めていきます。 \
極座標を使った微小要素を積分しても良いし、薄い円板を重ねても、玉ねぎみたいに薄い球の殻を重ねても良いです。

円板を重ねるのは授業資料の解き方ですね。

