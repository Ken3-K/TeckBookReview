#import "@preview/physica:0.9.5": *
#import "../lib/document-boxes.typ": *

#set text(font: "Hiragino Kaku Gothic ProN", size: 10pt)
#set heading(numbering: "1.")
#set math.equation(numbering: "(1)", supplement: [式])
#set page(numbering: "1")

#title([
  物理学で出てくる偏微分方程式
])

// #outline(indent: auto)

= 2階偏微分方程式

// #theorem[
//   2階線形偏微分方程式 $A pdv(u, x, 2) + B pdv(u, x, y) + C pdv(u, y, 2) + ... = 0$ において、判別式 $Delta = B^2 - 4 A C$ により分類される：
//   - $Delta > 0$: 双曲形 (hyperbolic)
//   - $Delta = 0$: 放物形 (parabolic)
//   - $Delta < 0$: 楕円形 (elliptic)
// ]

// #pagebreak(weak: true)

#problem(feature: "双曲形")[
  次の偏微分方程式を解け

  $
    pdv(u, x, 2) - 3 pdv(u, x, y) + 2 pdv(u, y, 2) = 0
  $
]

#solution[
  判別式$B^2 - A C = (3/2)^2 - 1 dot 2 = 1/4 > 0$よりこれは双曲形である。

  特性曲線の式は
  $d y^2 + 3 d x d y + 2 d x^2 = 0$
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


#pagebreak()

#problem(feature: "放物形 (Parabolic Type) - 特殊な拡散現象")[
  次の微分方程式を解け
  $
    pdv(u, x, 2) + 2pdv(u, x, y) + pdv(u, y, 2) = 0
  $
]

#solution[
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
]

#note[
  これは$x = y$の方向には一切情報が変化せず、その軸に沿って線形に情報が分布するような極端な拡散モデルと解釈できる。

  特定の結晶構造に沿ってのみ熱が伝わるような極端な異方性を持つ熱伝導などに対応する。
]

#pagebreak()

#problem(feature: "楕円形 (Elliptic Type) - 傾いた世界の定常状態")[
  次の微分方程式を解け
  $
    5pdv(u,x,2) + 4pdv(u,x,y) + pdv(u,y,2) = 0
  $<eq:elliptic>
]

#solution[
  判別式を計算すると
  $
    B^2 - A C = 2^2 - 5 dot 1 = 4 - 5 = -1 < 0
  $
  なので楕円形である。特性曲線の式は
  $
    5 d y^2 - 4 d x d y + d x^2 = 0 \
    5y'^2 - 4y' + 1 = 0\
    y' = (2 plus.minus i)
  $
  実数部分と虚数部分で分けて
  $
    xi = 5y - 2x, quad eta = x
  $
  とおくと、元の方程式は標準形
  $
    pdv(u, xi, 2) + pdv(u, eta, 2) = 0
  $
  に変換される。これはラプラス方程式の形である。
  
  一般解は調和関数である。
]

#note[
  ラプラス方程式は定常状態を表す式である。例えば、電磁場のスカラーポテンシャル$phi.alt$は、電荷密度を$rho$,誘電率を$epsilon$として次のように表せる
  $
    laplace phi.alt = rho/epsilon
  $
  電荷がない箱の中を考えると
  $
    laplace phi.alt = 0
  $
  となり定常状態であることがわかる。これは境界問題として解かれる。一方、@eq:elliptic は例えば水の流れるホースの動きに対応する方程式であるため、不安定な式となっている。（$y$を時間$t$として取ってみるとわかりやすいかもしれない。）
]

#pagebreak()

== おまけ
#problem(
  feature: "勢いよく水が流れるホースの運動",
  [
    太さの無視できるホースの中を、水が$x$方向に一様の速さ$v_0$で流れる場合を考える。ホースの質量綿密度を$lambda_h$、水の質量綿密度を$lambda_w$とし、ホースはほとんど$x$軸上にあり、$y$座標$u$は小さいとする。この時このホースの運動方程式 i.e. $u(t,x)$についての運動方程式を求めよ。
  ]
)

#solution([
  #grid(
    columns: 2,
    gutter: 1em,
    align(center)[
      #image("img/hose_with_water.jpeg", width: 90%)
      ホースに水が流れている状態
    ],
    align(center)[
      #image("img/force_on_hose_from_water.jpeg", width: 90%)
      水からホースが受ける力
    ]
  )
  ホースが水から単位長さあたりに受ける力を$f$とする。ホースに働く力は水からの外力$f$と張力$T$である。ホースの微小要素$x - (Delta x) / 2 tilde x + (Delta x) / 2$の運動方程式は
  $
    lambda_h Delta x pdv(u, t, 2) = T pdv(u,x)(x + (Delta x) / 2, t) - T pdv(u,x)(x - (Delta x) / 2, t) + f Delta x
  $
  となる。#footnote[ここで左側$(x - (Delta x) / 2)$は傾きが正だと下に引っ張り、右側$(x + (Delta x) / 2)$は傾きが正だと上に引っ張るので、それに対応する符号となっている。]

  $Delta x arrow 0$の極限を取ると、テイラー展開により
  $
    T pdv(u,x)(x + (Delta x) / 2, t) - T pdv(u,x)(x - (Delta x) / 2, t) = T pdv(u,x,2) Delta x + O((Delta x)^2)
  $
  と書けるので
  ホースの運動方程式は
  $
    lambda_h pdv(u, t, 2) = f + T pdv(u, x, 2)
  $
  となる。水の方は一定速度$u_0$で運動するので運動方程式は
  $
    lambda_w dv(u,t, 2) = -f
  $
  となる。ここで、時間微分は対流微分
  $
    dv(,t) = pdv(,t) + pdv(x,t) pdv(,x) = pdv(,t) + v_0 pdv(,x)
  $
  である。$f$を消去すると
  $
    lambda_w (pdv(,t) + v_0 pdv(,x))^2 u + lambda_h pdv(u,t,2) = T pdv(u,x,2)
  $
  となり、これを整理すると
  $
    (lambda_w + lambda_h) pdv(u,t,2) + 2 lambda_w v_0 pdv(u,t,x) + lambda_w v_0^2 pdv(u,t,2)  = T pdv(u,x,2)
  $
  ここで$alpha = lambda_w / (lambda_w + lambda_h), c^2 = T / (lambda_w + lambda_h)$とおくと
  $
    pdv(u,t,2) + 2 alpha v_0 pdv(u,x,t) + alpha v_0^2 pdv(u,x,2) = c^2pdv(u,x,2)
  $
  という偏微分方程式を得る。
])
#note([
  この微分方程式はホースのうねうねした動きを表すので、不安定な挙動をすることはわかりやすいだろう。変数変換でラプラス方程式になっても、それは時間と空間が入り混じった座標で定常であることを意味するだけで、物理的な時間については不安定となる場合がある。
])