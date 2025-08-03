#import "@preview/physica:0.9.5": *
#set text(font: "Hiragino Kaku Gothic ProN", size: 12pt)
#set heading(numbering: "1.")
#set math.equation(numbering: "(1)", supplement: [式])
#set page(numbering: "1")

// Title
#let title(content) = {
  set align(center)
  set text(weight: "black", size: 2em)
  [#content]
}

// Problem box function with feature label
#let problem(label: "例題", feature: none, content) = {
  if feature != none [
    #block(
      fill: rgb("#e6f3ff"),
      stroke: (bottom: 1pt + rgb("#4169e1")),
      inset: (x: 8pt, y: 4pt),
      width: 100%,
    )[
      #text(size: 10pt, fill: rgb("#4169e1"), weight: "bold")[#feature]
    ]
  ]
  block(
    fill: rgb("#f0f8ff"),
    stroke: 2pt + rgb("#4169e1"),
    radius: (top: if feature != none { 0pt } else { 8pt }, bottom: 8pt),
    inset: 12pt,
    width: 100%,
  )[
    *#label:* #content
  ]
}

// Solution box function
#let solution(label: "解答", content) = {
  block(
    fill: rgb("#f8fff8"),
    stroke: 2pt + rgb("#228b22"),
    radius: 8pt,
    inset: 12pt,
    width: 100%,
  )[
    *#label:* #content
  ]
}

// Theorem box function
#let theorem(label: "定理", content) = {
  block(
    fill: rgb("#fff0f0"),
    stroke: 2pt + rgb("#dc143c"),
    radius: 8pt,
    inset: 12pt,
    width: 100%,
  )[
    *#label:* #content
  ]
}

// Note/Important box function
#let note(label: "注釈", content) = {
  block(
    fill: rgb("#fff8dc"),
    stroke: 2pt + rgb("#ff8c00"),
    radius: 8pt,
    inset: 12pt,
    width: 100%,
  )[
    *#label:* #content
  ]
}

// Hint box function
#let hint(content) = {
  block(
    fill: rgb("#f5f5dc"),
    stroke: (left: 4pt + rgb("#daa520")),
    inset: 8pt,
    width: 100%,
  )[
    💡 *ヒント:* #content
  ]
}

// Step function for step-by-step solutions
#let step(number, content) = [
  #text(weight: "bold", fill: rgb("#4169e1"))[Step #number:] #content
]
#title([
  物理学で出てくる偏微分方程式
])

#outline(indent: auto)

= 2階偏微分方程式

#theorem[
  2階線形偏微分方程式 $A pdv(u, x, 2) + B pdv(u, x, y) + C pdv(u, y, 2) + ... = 0$ において、判別式 $Delta = B^2 - 4 A C$ により分類される：
  - $Delta > 0$: 双曲形 (hyperbolic)
  - $Delta = 0$: 放物形 (parabolic)
  - $Delta < 0$: 楕円形 (elliptic)
]

== 特性曲線を使うPDE

=== 双曲形 (Hyperbolic Type) - 異方性媒質の波

#problem(feature: "特性曲線法・変数変換")[
  次の偏微分方程式を解け

  $
    pdv(u, x, 2) - 3 pdv(u, x, y) + 2 pdv(u, y, 2) = 0
  $
]

#solution[
  判別式$B^2 - A C = (3/2)^2 - 1 dot 2 = 1/4 > 0$よりこれは双曲形である。

  特性曲線の式は
  $
    d y^2 + 3 d x d y + 2 d x^2 = 0
  $
  であるので
  $
    (d y + d x)(d y + 2 d x) = 0
  $

  $d y + d x = 0$より$d(y + x) = 0$, $therefore x + y = c_1$

  $d y + 2d x = 0$より$d(y + 2x) = 0, therefore y + 2x = c_2$

  したがって$xi = x + y, quad eta = 2x + y$とおくと
  $
        pdv(, x) & = pdv(xi, x) pdv(, xi) + pdv(eta, x) pdv(, eta) = pdv(, xi) + 2 pdv(, eta) \
     pdv(, x, 2) & = pdv(, x)(pdv(, xi) + 2 pdv(, eta)) = pdv(, xi, 2) + 4 pdv(, xi, eta) + 4 pdv(, eta, 2) \
        pdv(, y) & = pdv(xi, y) pdv(, xi) + pdv(eta, y) pdv(, eta) = pdv(, xi) + pdv(, eta) \
     pdv(, y, 2) & = pdv(, xi, 2) + 2 pdv(, xi, eta) + pdv(, eta, 2) \
    pdv(xi, eta) & = pdv(, xi, 2) + 3 pdv(, xi, eta) + pdv(, eta, 2)
  $

  これを元の式に代入して
  $
    pdv(u, xi, eta) = 0
  $
  これを解くと
  $
    u = f(xi) + g(eta) = f(x + y) + g(2x + y)
  $
]

#note[
  双曲形PDEは波動方程式の一般化であり、特性曲線上で情報が伝播する。この例では2つの特性曲線 $x + y = "const"$ と $2x + y = "const"$ が存在する。この問題の場合は$f, g$はそれぞれ形を保ったまま傾きが$-1, -2$の方向に伝播する波である。
]

=== 放物形 (Parabolic Type) - 特殊な拡散現象
#problem(feature: "一重特性曲線・特殊変数変換")[
  次の微分方程式を解け
  $
    pdv(u, x, 2) + 2pdv(u, x, y) + pdv(u, y, 2) = 0
  $
]

#solution([
  判別式は
  $
    B^2 - A C = 1 - 1 = 0
  $
  より放物形である。特性曲線の式は
  $
    d y^2 - 2d x d y + d x^2 = (d y - d x )^2 = 0
  $
  したがって $y - x = c$. $xi = y - x, quad eta = x$とおくと
  $
    pdv(, x) & = pdv(xi, x) pdv(, xi) + pdv(eta, x) pdv(, eta) = -pdv(, xi) + pdv(, eta) \
    pdv(, y) & = pdv(xi, y) pdv(, xi) + pdv(eta, y) pdv(, eta) = pdv(, xi) \
  $
  なので、元の方程式に代入すると
  $
    pdv(u, eta, 2) = 0
  $
  と簡単な式になる。これを解くと
  $
    u = eta f(xi) + g(xi) = x f(y-x) + g(y -x)
  $
  となる。
])

#note([
  これは$x = y$の方向には一切情報が変化せず、その軸に沿って線形に情報が分布するような極端な拡散モデルと解釈できる。

  特定の結晶構造に沿ってのみ熱が伝わるような極端な異方性を持つ熱伝導などに対応する。
])



