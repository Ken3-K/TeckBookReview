#import "@preview/physica:0.9.5": *
#import "../lib/document-boxes.typ": *
#set text(font: "Hiragino Kaku Gothic ProN", size: 10pt)
#set heading(numbering: "1.")

// Title
#let title(content) = {
  set align(center)
  set text(weight: "black", size: 1.5em)
  [#content]
}

#title([
  練習問題
])

// 導関数
#problem(
  feature: "導関数",
  [関数$f(x)$の導関数の定義式を書け。],
  [次の$x$の関数の導関数を定義から求めよ。
    $
      (1) x quad (2) x^5 quad (3) 1/x quad (4) 1/x^3 quad (5) log (x + a) quad (6) cos x quad (7) b^x
    $],
)

#solution(
  [
    関数$f(x)$の導関数の定義式
    $
      f'(x) = lim_(h -> 0) (f(x+h) - f(x))/h
    $
  ],
  [各関数の導関数

    (1) $f(x) = x$ のとき
    $
      f'(x) = lim_(h -> 0) ((x+h) - x)/h = lim_(h -> 0) h/h = 1
    $

    (2) $f(x) = x^5$ のとき
    $
      f'(x) = lim_(h -> 0) ((x+h)^5 - x^5)/h
    $
    二項定理を用いて $(x+h)^5 = x^5 + 5x^4h + 10x^3h^2 + 10x^2h^3 + 5x h^4 + h^5$ より
    $
      f'(x) & = lim_(h -> 0) (5x^4h + 10x^3h^2 + 10x^2h^3 + 5x h^4 + h^5)/h \
            & = lim_(h -> 0) (5x^4 + 10x^3h + 10x^2h^2 + 5x h^3 + h^4) \
            & = 5x^4
    $

    (3) $f(x) = 1/x$ のとき
    $
      f'(x) = lim_(h -> 0) (1/(x+h) - 1/x)/h = lim_(h -> 0) (x - (x+h))/(h x(x+h)) = lim_(h -> 0) (-h)/(h x(x+h)) = -1/x^2
    $

    (4) $f(x) = 1/x^3 = x^(-3)$ のとき
    $
      f'(x) & = lim_(h -> 0) (1/(x+h)^3 - 1/x^3)/h \
            & = lim_(h -> 0) (x^3 - (x+h)^3)/(h x^3(x+h)^3) \
            & = lim_(h -> 0) (x^3 - (x^3 + 3x^2h + 3x h^2 + h^3))/(h x^3(x+h)^3) \
            & = lim_(h -> 0) (-3x^2h - 3x h^2 - h^3)/(h x^3(x+h)^3) \
            & = lim_(h -> 0) (-3x^2 - 3x h - h^2)/(x^3(x+h)^3) \
            & = (-3x^2)/(x^3 · x^3) = -3x^2/x^6 = -3/x^4
    $

    (5) $f(x) = log (x + a)$ のとき
    $
      f'(x) & = lim_(h -> 0) (log(x+h+a) - log(x+a))/h \
        & = lim_(h -> 0) log((x+h+a)/(x+a))/h \
        & = lim_(h -> 0) log(1 + h/(x+a))/h \
        & = lim_(h -> 0) (1/(x+a)) · log(1 + h/(x+a))/(h/(x+a)) \
        & = 1/(x+a) lim_(h -> 0) log(1 + h/(x+a))/(h/(x+a)) \
        & = 1/(x+a) · 1 = 1/(x+a)
    $

    (6) $f(x) = cos x$ のとき
    $
      f'(x) & = lim_(h -> 0) (cos(x+h) - cos x)/h \
      & = lim_(h -> 0) 1/h [ cos(x + h/2 + h/2) - cos(x + h/2 - h/2)] \
      & = lim_(h -> 0) (-2 sin(x + h/2) sin(h/2))/h \
      & = -lim_(h -> 0) sin(x + h/2) · lim_(h -> 0) (2 sin(h/2))/h \
      & = -sin x · lim_(h -> 0) (sin(h/2))/(h/2) \
      & = -sin x · 1 = -sin x
    $
    但し、3行目では三角関数の加法定理
    $
      cos(alpha + beta) = cos alpha cos beta - sin alpha sin beta\
      cos(alpha - beta) = cos alpha cos beta + sin alpha sin beta
    $
    を用いた。

    (7) $f(x) = b^x$ のとき
    $
      f'(x) & = lim_(h -> 0) (b^(x+h) - b^x)/h \
        & = lim_(h -> 0) (b^x b^h - b^x)/h \
        & = b^x lim_(h -> 0) (b^h - 1)/h \
        & = b^x log b
    $
    ここで $lim_(h -> 0) (b^h - 1)/h = log b$ を用いた。

    実際に、$lim_(h -> 0) (b^h - 1)/h = log b$ であることを示すと：
    $b^h = e^(h log b)$ なので、
    $
      lim_(h -> 0) (b^h - 1)/h & = lim_(h -> 0) (e^(h log b) - 1)/h \
      & = lim_(h -> 0) (e^(h log b) - 1)/(h log b) · log b \
      & = log b · lim_(h -> 0) (e^(h log b) - 1)/(h log b)
    $
    $t = h log b$ とおくと、$h -> 0$ のとき $t -> 0$ であり、
    $
      lim_(h -> 0) (e^(h log b) - 1)/(h log b) = lim_(t -> 0) (e^t - 1)/t = 1
    $
    したがって、$lim_(h -> 0) (b^h - 1)/h = log b · 1 = log b$
    ],
)

#pagebreak()

// 微分
#problem(
  feature: "微分",
  [次の関数を$x$で微分しなさい。
    $
      (1) x^3 quad (2) x e^x quad (3) x log x quad (4) sin x quad (5) cos x \ (6) tan x quad (7) log(3x^2 + 4) quad (8) log(sin x)
    $
  ]
)
#solution([
  (1) $(x^3)' = 3x^2$

  (2) $(x e^x)'$ （積の微分法）
  $
    (x e^x)' = (x)' e^x + x (e^x)' = 1 · e^x + x · e^x = e^x (1 + x)
  $

  (3) $(x log x)'$ （積の微分法）
  $
    (x log x)' = (x)' log x + x (log x)' = 1 · log x + x · 1/x = log x + 1
  $

  (4) $(sin x)' = cos x$

  (5) $(cos x)' = -sin x$

  (6) $(tan x)'$ 
  $
    (tan x)' &= ((sin x) / (cos x))' \
    &= (cos x · cos x - sin x · (-sin x))/(cos x)^2 \
    &= (cos^2 x + sin^2 x)/(cos^2 x) \
    &= 1/(cos^2 x)
  $

  (7) $(log(3x^2 + 4))'$ （合成関数の微分法）
  $
    (log(3x^2 + 4))' = 1/(3x^2 + 4) · (3x^2 + 4)' = 1/(3x^2 + 4) · 6x = (6x)/(3x^2 + 4)
  $

  (8) $(log(sin x))'$ （合成関数の微分法）
  $
    (log(sin x))' = 1/(sin x) · (sin x)' = 1/(sin x) · cos x = (cos x)/(sin x)
  $
])

#pagebreak()

// 波動方程式
#problem([
  a, b, を定数として
  $x = a sin omega t + b cos omega t$
  のとき、
  $
    x = sqrt(a^2 + b^2) sin(omega t + phi.alt)
  $
  とかけることを示せ。
],[
  $x$が満たす2階微分方程式を一つ求めよ。
])

#solution([
  三角関数の合成公式を用いて証明する。

  $x = a sin omega t + b cos omega t$ において、
  $A = sqrt(a^2 + b^2)$ とおき、$phi.alt$ を
  $
    cos phi.alt = a/A, quad sin phi.alt = b/A
  $
  を満たす角とする。

  このとき、
  $
    x &= a sin omega t + b cos omega t \
      &= A(a/A sin omega t + b/A cos omega t) \
      &= A(cos phi.alt sin omega t + sin phi.alt cos omega t) \
      &= A sin(omega t + phi.alt)
  $

  したがって、$x = sqrt(a^2 + b^2) sin(omega t + phi.alt)$ が成り立つ。
  ],
  [
  $x = a sin omega t + b cos omega t$ を $t$ で微分すると：
  $
    (d x)/(d t) = a omega cos omega t - b omega sin omega t
  $

  さらに微分すると：
  $
    (d^2 x)/(d t^2) = -a omega^2 sin omega t - b omega^2 cos omega t = -omega^2(a sin omega t + b cos omega t) = -omega^2 x
  $

  したがって、$x$ が満たす2階微分方程式は：
  $
    (d^2 x)/(d t^2) + omega^2 x = 0
  $
])

#pagebreak()
// 増減表
#problem(feature: "増減表",[
  次の関数の増減表を作成し、グラフの概形をかけ。

  (1) $y = x^3$\
  (2) $y = x^4 - 8x^2$
])
#solution([
  (1) $y = x^3$ の増減表とグラフ

  $y' = 3x^2$

  $y' = 0$ となるのは $x = 0$ のとき

  $y'' = 6x$

  増減表：
  #table(
    columns: 4,
    align: center,
    [$x$], [$dots$], [$0$], [$dots$], 
    [$y'$], [$+$], [$0$], [$+$],
    [$y$], [↗], [$0$], [↗]
  )

  $x = 0$ で $y'' = 0$ なので変曲点。$y(0) = 0$

  グラフの概形：原点を通る単調増加の3次関数で、原点で変曲している。

  (2) $y = x^4 - 8x^2$ の増減表とグラフ

  $y' = 4x^3 - 16x = 4x(x^2 - 4) = 4x(x-2)(x+2)$

  $y' = 0$ となるのは $x = -2, 0, 2$ のとき

  $y'' = 12x^2 - 16$

  各点での値：
  - $y(-2) = 16 - 32 = -16$
  - $y(0) = 0$  
  - $y(2) = 16 - 32 = -16$

  増減表：
  #table(
    columns: 8,
    align: center,
    [$x$], [$...$], [$-2$], [$...$], [$0$], [$...$], [$2$], [$...$],
    [$y'$], [$-$], [$0$], [$+$], [$0$], [$-$], [$0$], [$+$],
    [$y$], [↘], [$-16$], [↗], [$0$], [↘], [$-16$], [↗]
  )

  グラフの概形：$x =  plus.minus 2$ で極小値 $-16$、$x = 0$ で極大値 $0$ をとる4次関数。
])

#pagebreak()

// 積分
#problem(feature: "積分", [
  次の関数を$x$について積分せよ。
  $
    (1) 1 / (3x + 2) quad (2) log x quad (3) x e^x quad (4) tan x quad (5) (6x)/(3x^2 + 4) quad (6) (cos x) / (sin x) quad (7) 1/sqrt(a^2 - x^2)
  $
])

#solution([
  (1) $integral 1/(3x + 2) d x$
  
  $u = 3x + 2$ とおくと、$d u = 3 d x$ より $d x = 1/3 d u$
  $
    integral 1/(3x + 2) d x = integral 1/u · 1/3 d u = 1/3 integral 1/u d u = 1/3 log|u| + C = 1/3 log|3x + 2| + C
  $
  つまり、$integral d x / (a x + b)$の積分は、すぐに$log|a x + b| + C$とできることがわかりますね。

  (2) $integral log x d x$ （部分積分を使用）
  
  $integral log x · 1 d x$ において、$log x$ を微分し、$1$ を積分する
  $
    integral log x d x &= log x · x - integral (log x)' · x d x \
    &= x log x - integral 1/x · x d x \
    &= x log x - integral 1 d x \
    &= x log x - x + C
  $

  (3) $integral x e^x d x$ （部分積分を使用）
  
  $integral x · e^x d x$ において、$x$ を微分し、$e^x$ を積分する
  $
    integral x e^x d x &= x · e^x - integral (x)' · e^x d x \
    &= x e^x - integral 1 · e^x d x \
    &= x e^x - e^x + C \
    &= e^x(x - 1) + C
  $

  (4) $integral tan x d x = integral (sin x)/(cos x) d x$
  
  $(cos x)' = -sin x$ を用いて、
  $
    integral (sin x)/(cos x) d x &= -integral (cos x)'/(cos x) d x \
    &= -log|cos x| + C \
    &= log|sec x| + C
  $

    (5) $integral (6x)/(3x^2 + 4) d x$ （分子が分母の微分）
    
    $(3x^2 + 4)' = 6x$ であることを利用して、
    $
      integral (6x)/(3x^2 + 4) d x = integral ((3x^2 + 4)')/(3x^2 + 4) d x = log|3x^2 + 4| + C
    $

  (6) $integral (cos x)/(sin x) d x$ 
  
  $(sin x)' = cos x$ であることを利用して、
  $
    integral (cos x)/(sin x) d x = integral ((sin x)')/(sin x) d x = log|sin x| + C
  $

  (7) $integral 1/sqrt(a^2 - x^2) d x$ （標準形の逆三角関数）
  
  これは逆三角関数の標準形である。$x = a sin theta$ の置換を用いると：
  $d x = a cos theta d theta$, $sqrt(a^2 - x^2) = a cos theta$
  $
    integral 1/sqrt(a^2 - x^2) d x &= integral 1/(a cos theta) · a cos theta d theta \
    &= integral d theta = theta + C \
    &= arcsin(x/a) + C
  $
  
  ここで$arcsin x$とは$sin x$の逆関数、つまり$x, y$が$y = sin x$を満たすとき、$x = arcsin y$と書ける関数である。
])

#pagebreak()

// 微分方程式

#problem(feature: "微分方程式",[
  次の微分方程式を解け。

  $
    (1)& quad (d y)/ (d x) = 2 x \
    (2)& quad  (d y)/ (d x) = x y \
    (3)& quad  (d y)/ (d x) = (1+x) / y
  $
])
#solution([
  積分定数は$C$とする。

  (1)
  $
    d y &= 2 x d x \
    integral d y &= integral 2 x d x \
    y & = 2 dot 1/(1 + 1) x^(1 + 1) + C \
    y &= x^2 + C
  $
(2)
これは左辺に$y$、右辺に$x$をまとめて
$
  (d y) / y &= x d x \
  log|y| &= 1/2 x^2 + C' \
  y &= C exp(1/2 x^2)
$
(3)
これもやることは(2)と全く変わらず、
$
  y d y &= (1 + x) d x \
  1/2 y^2 &= x + 1/2 x^2 + C \
  y &= sqrt(x + 1/2 x^2 + C )
$
])

#pagebreak()

// 運動方程式
#problem(feature: "運動方程式",[
  自由落下する質量$m$の質点の運動方程式を立て、それを解け。
],[
  速度に比例する空気抵抗がある場合、運動方程式は次のようになる。これを解き、終端速度を求めよ。
  $
    m (d^2 x)/(d t ^2) = m g - k (d x) / (d t) 
  $
],[
  放射性物質の数$N$は崩壊率を$gamma$とすると次のように書ける。$N(t)$を求めよ。
  $
    (d N) / (d t) = - gamma N
  $
],[
  人口などは次のロジスティック方程式で近似的に表せる。これを解け。
  $
    (d N) / (d t) = r N times (M - N)/M
  $
])

#solution([
  自由落下の運動方程式とその解

  重力加速度を$g$として、下向きを正の方向とする。
  質点に働く力は重力$m g$のみなので
  $
    m (d^2 x)/(d t^2) = m g
  $

  $m$で割って
  $
    (d^2 x)/(d t^2) = g
  $

  1回積分して：
  $
    (d x)/(d t) = g t + C_1
  $

  初期条件として$t = 0$で$v = 0$とすると、$C_1 = 0$
  $
    v = (d x)/(d t) = g t
  $

  もう1回積分して：
  $
    x = 1/2 g t^2 + C_2
  $

  初期条件として$t = 0$で$x = 0$とすると、$C_2 = 0$
  $
    x = 1/2 g t^2
  $
],[
  空気抵抗がある場合の運動方程式とその解

  運動方程式：
  $
    m (d^2 x)/(d t^2) = m g - k (d x)/(d t)
  $

  $v = (d x)/(d t)$とおくと：
  $
    m (d v)/(d t) = m g - k v
  $

  変数分離して：
  $
    (d v)/(m g - k v) = (d t)/m
  $

  左辺を積分する。$u = m g - k v$とおくと$d u = -k d v$より$d v = -(d u)/k$
  $
    integral (d v)/(m g - k v) = integral -(d u)/(k u) = -1/k log|u| = -1/k log|m g - k v|
  $

  したがって：
  $
    -1/k log|m g - k v| = t/m + C
  $

  初期条件$t = 0$で$v = 0$を用いると：
  $
    -1/k log(m g) = C
  $

  よって：
  $
    -1/k log|m g - k v| = t/m - 1/k log(m g)
  $
  $
    log|m g - k v| - log(m g) = -(k t)/m
  $
  $
    log|(m g - k v)/(m g)| = -(k t)/m
  $
  $
    (m g - k v)/(m g) = e^(-(k t)/m)
  $
  $
    v = (m g)/k (1 - e^(-(k t)/m))
  $

  終端速度は$t → ∞$での速度：
  $
    v_"terminal" = (m g)/k
  $
],[
  放射性崩壊の微分方程式とその解

  微分方程式：
  $
    (d N)/(d t) = -gamma N
  $

  変数分離して：
  $
    (d N)/N = -gamma d t
  $

  両辺を積分：
  $
    integral (d N)/N = integral -gamma d t
  $
  $
    log|N| = -gamma t + C
  $

  したがって：
  $
    N = A e^(-gamma t)
  $

  初期条件$t = 0$で$N = N_0$とすると：
  $
    N_0 = A e^0 = A
  $

  よって：
  $
    N(t) = N_0 e^(-gamma t)
  $

  これは指数関数的減衰を表している。
],[
  ロジスティック方程式とその解

  微分方程式：
  $
    (d N)/(d t) = r N (M - N)/M
  $

  変数分離して：
  $
    (M d N)/(N(M - N)) = r d t
  $

  左辺を部分分数分解する：
  $
    M/(N(M - N)) = A/N + B/(M - N)
  $

  $M = A(M - N) + B N = A M + (B - A) N$より、$A = 1, B = 1$

  したがって：
  $
    M/(N(M - N)) = 1/N + 1/(M - N)
  $

  積分すると：
  $
    integral (1/N + 1/(M - N)) d N = integral r d t
  $
  $
    log|N| - log|M - N| = r t + C
  $
  $
    log|N/(M - N)| = r t + C
  $
  $
    N/(M - N) = A e^(r t)
  $

  初期条件$t = 0$で$N = N_0$を用いると：
  $
    A = N_0/(M - N_0)
  $

  したがって：
  $
    N/(M - N) = (N_0/(M - N_0)) e^(r t)
  $

  これを$N$について解くと：
  $
    N(M - N_0) = N_0 (M - N) e^(r t)
  $
  $
    N M - N N_0 = N_0 M e^(r t) - N N_0 e^(r t)
  $
  $
    N M + N N_0 e^(r t) = N N_0 + N_0 M e^(r t)
  $
  $
    N(M + N_0 e^(r t)) = N_0 M e^(r t)
  $

  よって：
  $
    N(t) = (N_0 M e^(r t))/(M + N_0 e^(r t))
  $

  分子分母を$e^(r t)$で割ると：
  $
    N(t) = (N_0 M)/(M e^(-r t) + N_0) = M/(1 + (M/N_0 - 1) e^(-r t))
  $

  $t → ∞$で$N → M$となる。

])

#pagebreak()

// 偏微分
#problem(feature: "偏微分",[
  次の関数を$x, y$それぞれで偏微分せよ
  $
    f(x, y) &= x^2 y^3 \
    f(x, y) &= log(x^2 + y^3) \
    f(x, y) &= log (x y) \
    f(x, y) &= sin 3x cos 2y \
  $
])

#solution([
  $f(x, y) = x^2 y^3$
  $
    pdv(f,x) &= 2x dot y^3 = 2x y^3 \
    pdv(f,y) &= x^2 dot 3y^2 = 3x^2 y^2
  $
],[
  $f(x, y) = log(x^2 + y^3)$
  $
    pdv(f,x) &= 1/(x^2 + y^3) times pdv((x^2 + y^3), x) = (2 x) / (x^2 + y^3) \
    pdv(f,y) &= 1/(x^2 + y^3) times pdv((x^2 + y^3), y) = (3 y^2) / (x^2 + y^3)
  $
],[
  $f(x, y) = log(x y)$
  $
    pdv(f,x) &= 1/(x y) times pdv((x y), x) = y / (x y) = 1/x \
    pdv(f,y) &= 1/(x y) times pdv((x y), y) = x / (x y) = 1/y
  $
],[
  $f(x, y) = sin 3x cos 2y$
  $
    pdv(f,x) &= pdv((sin 3x), x) times cos 2y = 3 cos 3x times cos 2y = 3 cos 3x cos 2y \
    pdv(f,y) &= sin 3x times pdv((cos 2y), y) = sin 3x times (-2 sin 2y) = -2 sin 3x sin 2y
  $
])

#pagebreak()

// 全微分
#problem(feature: "全微分",[
  次の関数を全微分せよ。
  $
    f(x, y) = x^3 y^2\
    f(x, y) = log(x y)
  $
])

#solution([
  $f(x, y) = x^3 y^2$
  $
    pdv(f,x) &= 3x^2 y^2 \
    pdv(f,y) &= 2x^3 y \
    d f &= pdv(f,x) d x + pdv(f,y) d y = 3x^2 y^2 d x + 2x^3 y d y
  $],[
  $f(x, y) = log(x y)$
  $
    pdv(f,x) &= 1/x \
    pdv(f,y) &= 1/y \
    d f &= pdv(f,x) d x + pdv(f,y) d y = (d x)/x + (d y)/y
  $
])

#pagebreak()

// 微分の可換性
#problem(feature: "微分の可換性",[
  $f(x, y) = cos x y$ について, $
      pdv(,y)pdv(f, x) = pdv(, x) pdv(f, y)
    $ が成り立つことを示せ。
])
#solution([
  $f(x, y) = cos(x y)$ について偏微分を計算する。

  $
    pdv(f,x) &= pdv((cos(x y)), x) = -sin(x y) · y = -y sin(x y) \
    pdv(f,y) &= pdv((cos(x y)), y) = -sin(x y) · x = -x sin(x y)
  $

  次に2階偏微分を計算する：

  $
    frac(∂, ∂y) (frac(∂f, ∂x)) &= frac(∂, ∂y) (-y sin(x y)) \
    &= -sin(x y) - y cos(x y) · x \
    &= -sin(x y) - x y cos(x y)
  $

  $
    frac(∂, ∂x) (frac(∂f, ∂y)) &= frac(∂, ∂x) (-x sin(x y)) \
    &= -sin(x y) - x cos(x y) · y \
    &= -sin(x y) - x y cos(x y)
  $

  したがって：
  $
    frac(∂, ∂y) (frac(∂f, ∂x)) = frac(∂, ∂x) (frac(∂f, ∂y)) = -sin(x y) - x y cos(x y)
  $

  よって、$frac(∂, ∂y) (frac(∂f, ∂x)) = frac(∂, ∂x) (frac(∂f, ∂y))$ が成り立つ。
])

#pagebreak()

// 誤差の伝播
#problem(feature: "誤差の伝播",[
  円柱の体積 $V = pi r^2 h$ において、半径の測定誤差を $Delta r$、高さの測定誤差を $Delta h$ とするとき、体積の誤差 $Delta V$, 相対誤差$(Delta V) / V$を $Delta r, Delta h$ を用いて表せ。
])
#solution([
  円柱の体積の誤差の伝播を求める。

  $V = π r^2 h$ において、$r$, $h$がそれぞれ$Delta r$, $Delta h$の誤差を持つとき、体積$V$の誤差$Delta V$は全微分を用いて近似できる。

  $
    d V = pdv(V,r) d r + pdv(V,h) d h
  $

  偏微分を計算すると：
  $
    pdv(V,r) &= pdv((π r^2 h), r) = 2π r h \
    pdv(V,h) &= pdv((π r^2 h), h) = π r^2
  $

  したがって：
  $
    Delta  V ≈ pdv(V,r) Delta  r + pdv(V,h) Delta  h = 2π r h Delta  r + π r^2 Delta  h
  $

  相対誤差は：
  $
    (Delta  V)/V &= (2π r h Delta  r + π r^2 Delta  h)/(π r^2 h) \
    &= (2π r h Delta  r)/(π r^2 h) + (π r^2 Delta  h)/(π r^2 h) \
    &= (2 Delta  r)/r + (Delta  h)/h
  $
])

#pagebreak()

// 数列
#problem(feature: "数列",[
  数列 $3, 8, 13, 18, ...$ について以下の問いに答えよ。
    
    (1). 一般項 $a_n$ を求めよ。
    
    (2). $sum_(k=1)^n a_k$ を求めよ。
])
#solution([
  数列 $3, 8, 13, 18, ...$ について

  (1) 一般項の導出

  初項が $a_1 = 3$、公差が $d = 8 - 3 = 5$ の等差数列である。

  等差数列の一般項は：
  $
    a_n = a_1 + (n-1)d = 3 + (n-1) \cdot 5 = 3 + 5n - 5 = 5n - 2
  $

  (2) 和の計算
  等差数列の和の公式を用いて：
  $
    sum_(k=1)^n a_k &= sum_(k=1)^n (5k - 2) \
    &= 5 sum_(k=1)^n k - 2 sum_(k=1)^n 1 \
    &= 5 \cdot (n(n+1))/2 - 2n \
    &= (5n(n+1))/2 - 2n \
    &= (5n^2 + 5n - 4n)/2 \
    &= (5n^2 + n)/2 \
    &= (n(5n + 1))/2
  $
])

#pagebreak()

#problem([
  数列 $1, -2, 4, -8, 16, ...$ について以下の問いに答えよ。
    
    (1). 一般項 $a_n$ を求めよ。
    
    (2). $sum_(k=1)^n a_k$ を求めよ。
])
#solution([
  数列 $1, -2, 4, -8, 16, ...$ について

  (1) 一般項の導出

  初項が $a_1 = 1$、公比が $r = -2$ の等比数列である。

  等比数列の一般項は：
  $
    a_n = a_1 dot r^(n-1) = 1 dot (-2)^(n-1) = (-2)^(n-1)
  $

  (2) 和の計算
  等比数列の和の公式を用いて（$r = -2 ≠ 1$）：
  $
    sum_(k=1)^n a_k &= sum_(k=1)^n (-2)^(k-1) \
    &= (1 - (-2)^n)/(1 - (-2)) \
    &= (1 - (-2)^n)/(1 + 2) \
    &= (1 - (-2)^n)/3
  $
])

#pagebreak()

#problem([
  $k^3 - (k - 1)^3 = 3k^2 - 3k + 1$ と書けることを用いて, $sum_(k=1)^n k^2$ を求めよ。
])
#solution([

  与えられた恒等式：
  $k^3 - (k-1)^3 = 3k^2 - 3k + 1$について、

  $k = 1, 2, 3, ..., n$ について辺々加えると：
  $
    sum_(k=1)^n [k^3 - (k-1)^3] &= sum_(k=1)^n (3k^2 - 3k + 1)
  $

  左辺は
  $
    sum_(k=1)^n [k^3 - (k-1)^3] &= (1^3 - 0^3) + (2^3 - 1^3) + (3^3 - 2^3) + ... + (n^3 - (n-1)^3) \
    &= n^3
  $

  右辺を展開すると：
  $
    sum_(k=1)^n (3k^2 - 3k + 1) &= 3 sum_(k=1)^n k^2 - 3 sum_(k=1)^n k + sum_(k=1)^n 1 \
    &= 3 sum_(k=1)^n k^2 - 3 dot (n(n+1))/2 + n \
    &= 3 sum_(k=1)^n k^2 - (3n(n+1))/2 + n
  $
  $
    therefore n^3 = 3 sum_(k=1)^n k^2 - (3n(n+1))/2 + n
  $

  $sum_(k=1)^n k^2$ について解くと：
  $
    3 sum_(k=1)^n k^2 &= n^3 + (3n(n+1))/2 - n \
    &= n^3 + (3n^2 + 3n)/2 - n \
    &= n^3 + (3n^2 + 3n - 2n)/2 \
    &= (2n^3 + 3n^2 + n)/2 \
    &= (n(2n^2 + 3n + 1))/2 \
    &= (n(n+1)(2n+1))/2
  $

  よって：
  $
    sum_(k=1)^n k^2 = (n(n+1)(2n+1))/6
  $
]
)  

#pagebreak()

// 無限級数
#problem(feature: "無限級数",[
  次の無限級数の一般項 $a_n$ を求めよ。また, 発散するか, 収束する場合には部分和 $S_n$ と収束値 $S$ を答えよ。

    (1) $1 + 1/2 + 1/2^2 + 1/2^3 + ...$

    (2) $1/(1 dot 2) + 1/(2 dot 3) + 1/(3 dot 4) + 1/(4 dot 5) + ...$

    (3) $(1 - 1) + (1/2 - 1/3) + (1/4 - 1/9) + (1/8 - 1/27) + ...$

    (4) $1 + 2/3 + 3/5 + 4/7 + ...$

    (5) $1 - 1/3 + 1/9 - 1/27 + ...$
])
#solution([
  $1 + 1/2 + 1/2^2 + 1/2^3 + ...$

  一般項：$a_n = 1/2^(n-1)$ （初項 $a_1 = 1$、公比 $r = 1/2$ の等比級数）

  $|r| = 1/2 < 1$ なので収束する。

  部分和：$S_n = (1 - (1/2)^n)/(1 - 1/2) = 2(1 - (1/2)^n)$

  収束値：$S = lim_(n → ∞) S_n = 2$],

[$1/(1·2) + 1/(2·3) + 1/(3·4) + 1/(4·5) + ...$

  一般項：$a_n = 1/(n(n+1))$

  部分分数分解により：$1/(n(n+1)) = 1/n - 1/(n+1)$

  部分和：
  $
    S_n &= sum_(k=1)^n 1/(k(k+1)) = sum_(k=1)^n (1/k - 1/(k+1)) \
    &= (1/1 - 1/2) + (1/2 - 1/3) + (1/3 - 1/4) + ... + (1/n - 1/(n+1)) \
    &= 1 - 1/(n+1) = n/(n+1)
  $

  収束値：$S = lim_(n → ∞) n/(n+1) = 1$],

  [$(1 - 1) + (1/2 - 1/3) + (1/4 - 1/9) + (1/8 - 1/27) + ...$

  一般項：$a_n = 1/2^(n-1) - 1/3^(n-1)$

  これは2つの等比級数の差：
  $
    sum_(n=1)^∞ a_n = sum_(n=1)^∞ 1/2^(n-1) - sum_(n=1)^∞ 1/3^(n-1) = 1/(1-1/2) - 1/(1-1/3) = 2 - 3/2 = 1/2
  $

  収束値：$S = 1/2$],

[$1 + 2/3 + 3/5 + 4/7 + ...$

  一般項：$a_n = n/(2n-1)$

  $lim_(n → ∞) a_n = lim_(n → ∞) n/(2n-1) = lim_(n → ∞) 1/(2-1/n) = 1/2 ≠ 0$

  一般項が0に収束しないため、級数は発散する。],

[$1 - 1/3 + 1/9 - 1/27 + ...$

  一般項：$a_n = (-1/3)^(n-1)$ （初項 $a_1 = 1$、公比 $r = -1/3$ の等比級数）

  $|r| = 1/3 < 1$ なので収束する。

  部分和：$S_n = (1 - (-1/3)^n)/(1 - (-1/3)) = (1 - (-1/3)^n)/(4/3) = 3/4(1 - (-1/3)^n)$

  収束値：$S = 3/4$
])
