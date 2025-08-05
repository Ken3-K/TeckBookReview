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
  2025/08/05の宿題
])

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
      & = lim_(h -> 0) (-2 sin((x+h+x)/2) sin((x+h-x)/2))/h \
      & = lim_(h -> 0) (-2 sin(x + h/2) sin(h/2))/h \
      & = -lim_(h -> 0) sin(x + h/2) · lim_(h -> 0) (2 sin(h/2))/h \
      & = -sin x · lim_(h -> 0) (sin(h/2))/(h/2) \
      & = -sin x · 1 = -sin x
    $

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
    (x e^x)' = (x)' e^x + x (e^x)' = 1 · e^x + x · e^x = e^x(1 + x)
  $

  (3) $(x log x)'$ （積の微分法）
  $
    (x log x)' = (x)' log x + x (log x)' = 1 · log x + x · 1/x = log x + 1
  $

  (4) $(sin x)' = cos x$

  (5) $(cos x)' = -sin x$

  (6) $(tan x)'$ 
  $
    (tan x)' &= (sin x / cos x)' \
    &= (cos x · cos x - sin x · (-sin x))/(cos x)^2 \
    &= (cos^2 x + sin^2 x)/(cos^2 x) \
    &= 1/(cos^2 x) \
    &= sec^2 x
  $

  (7) $(log(3x^2 + 4))'$ （合成関数の微分法）
  $
    (log(3x^2 + 4))' = 1/(3x^2 + 4) · (3x^2 + 4)' = 1/(3x^2 + 4) · 6x = (6x)/(3x^2 + 4)
  $

  (8) $(log(sin x))'$ （合成関数の微分法）
  $
    (log(sin x))' = 1/(sin x) · (sin x)' = 1/(sin x) · cos x = (cos x)/(sin x) = cot x
  $
])

#pagebreak()

#problem(feature: "積分", [
  次の関数を$x$について積分せよ。
  $
    (1) 1 / (3x + 2) quad (2) log x quad (3) x e^x quad (4) tan x quad (5) (6x)/(3x^2 + 4) quad (6) (cos x) / (sin x) quad (7) 1/sqrt(a^2 - x^2)
  $
])

#solution([
  (1) $integral 1/(3x + 2) dd(x)$
  
  $u = 3x + 2$ とおくと、$dd(u) = 3 dd(x)$ より $dd(x) = 1/3 dd(u)$
  $
    integral 1/(3x + 2) dd(x) = integral 1/u · 1/3 dd(u) = 1/3 integral 1/u dd(u) = 1/3 log|u| + C = 1/3 log|3x + 2| + C
  $

  (2) $integral log x dd(x)$ （部分積分を使用）
  
  $integral log x · 1 dd(x)$ において、$log x$ を微分し、$1$ を積分する
  $
    integral log x dd(x) &= log x · x - integral (log x)' · x dd(x) \
    &= x log x - integral 1/x · x dd(x) \
    &= x log x - integral 1 dd(x) \
    &= x log x - x + C
  $

  (3) $integral x e^x dd(x)$ （部分積分を使用）
  
  $integral x · e^x dd(x)$ において、$x$ を微分し、$e^x$ を積分する
  $
    integral x e^x dd(x) &= x · e^x - integral (x)' · e^x dd(x) \
    &= x e^x - integral 1 · e^x dd(x) \
    &= x e^x - e^x + C \
    &= e^x(x - 1) + C
  $

  (4) $integral tan x dd(x) = integral (sin x)/(cos x) dd(x)$
  
  $(cos x)' = -sin x$ を用いて、
  $
    integral (sin x)/(cos x) dd(x) &= -integral (cos x)'/(cos x) dd(x) \
    &= -log|cos x| + C \
    &= log|sec x| + C
  $

    (5) $integral (6x)/(3x^2 + 4) dd(x)$ （分子が分母の微分）
    
    $(3x^2 + 4)' = 6x$ であることを利用して、
    $
      integral (6x)/(3x^2 + 4) dd(x) = integral ((3x^2 + 4)')/(3x^2 + 4) dd(x) = log|3x^2 + 4| + C
    $

  (6) $integral (cos x)/(sin x) dd(x)$ 
  
  $(sin x)' = cos x$ であることを利用して、
  $
    integral (cos x)/(sin x) dd(x) = integral ((sin x)')/(sin x) dd(x) = log|sin x| + C
  $

  (7) $integral 1/sqrt(a^2 - x^2) dd(x)$ （標準形の逆三角関数）
  
  これは逆三角関数の標準形である。$x = a sin theta$ の置換を用いると：
  $dd(x) = a cos theta dd(theta)$, $sqrt(a^2 - x^2) = a cos theta$
  $
    integral 1/sqrt(a^2 - x^2) dd(x) &= integral 1/(a cos theta) · a cos theta dd(theta) \
    &= integral dd(theta) = theta + C \
    &= arcsin(x/a) + C
  $
])

#pagebreak()


