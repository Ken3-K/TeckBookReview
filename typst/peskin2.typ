#import "@preview/js:0.1.3": *
// or put your modified `js.typ` in the same folder and `#import "js.typ": *`
#import "@preview/physica:0.9.5": *

#show: js.with(
  lang: "ja",
  seriffont: "New Computer Modern",
  seriffont-cjk: "Hiragino Mincho ProN",
  sansfont: "Helvetica",
  sansfont-cjk: "Hiragino Kaku Gothic ProN",
  paper: "a4", // "a*", "b*", or (paperwidth, paperheight) e.g. (210mm, 297mm)
  fontsize: 10pt,
  baselineskip: auto,
  textwidth: auto,
  lines-per-page: auto,
  book: false, // or true
  cols: 1, // 1, 2, 3, ...
  non-cjk: regex("[\u0000-\u2023]"), // or "latin-in-cjk" or any regex
  cjkheight: 0.88, // height of CJK in em
)
#set math.equation(numbering: "(1)")

#maketitle(
  title: "Peskin2章",
  // authors: ("Authors Name",),
  date: datetime.today().display("[day]. [month repr:long] [year]"),
)


- p.14 U(t) の計算
時間並進の演算子は$e^(-i H t)$なので、$x_0$から$x$に遷移する確率振幅$U(t)$は
$
  U(t) &= bra(x) e^(-i H t) ket(x_0) \
  &= bra(x) e^(-i p^2 / (2m)) ket(x_0) \
  &= integral (d^3p) / (2 pi)^3 bra(x) e^(-i p^2 / (2m)) ket(p) braket(p,x_0) & "完全性関係を利用" \
  &= integral (d^3p) / (2 pi)^3 e^(-i p^2 / (2m)) braket(x, p) braket(p,x_0) \
  &= integral (d^3p) / (2 pi)^3 e^(-i p^2 / (2m)) e^(i p dot (x - x_0)) & (braket(x, p) = e^(i x dot p)) \
  &= integral (d^3p) / (2 pi)^3 e^(- i t / (2m)(p + m / t (x - x_0))^2) e^(i m / (2t) (x - x_0)^2) \
  &= 1 / (2 pi)^3 (( 2 m pi) / (i t))^(3 / 2) e^(i m / (2t) (x - x_0)^2) & "ガウス積分" \
  &= (m / (2 pi i t))^(3 / 2) e^(i m / (2t) (x - x_0)^2)
$
4行目では運動量の固有値を取るので、指数関数はブラケットの外に出すことができる。

- p.14二つ目の式の計算
$
  & integral d^3p e^(- i t sqrt(p^2 + m^2)) e^(i p dot (x - x_0)) \
  &= integral_0^(2 pi) d phi integral_0^infinity p^2 d p integral_(-1)^1 d mu e^(- i t sqrt(p^2 + m^2)) e^(i p|x - x_0| mu) \
  &= 2 pi integral_0^infinity p^2 d p 1 / (i p |x - x_0|)e^(- i t sqrt(p^2 + m^2)) (e^(i p|x - x_0|) - e^(-i p|x - x_0|)) \
  &= 4 pi integral_0^infinity d p p sin (p|x - x_0|)e^(- i t sqrt(p^2 + m^2))
$


- (2.2), (2.3)式の導出
$
  partial_mu (pdv(cal(L), (partial_mu phi)) delta phi) = partial_mu (pdv(cal(L), (partial_mu phi))) delta phi + pdv(cal(L), (partial_mu phi)) partial_mu (delta phi), quad partial_mu (delta phi) = delta(partial_mu phi)
$
であるから、
$
  0 &= delta S \
    &= integral d^4 x delta cal(L) \
    &= integral d^4 x {pdv(cal(L), phi)delta phi + pdv(cal(L), (partial_mu phi))delta(partial_mu phi)} \
    &= integral d^4 x {pdv(cal(L), phi)delta phi - partial_mu (pdv(cal(L), (partial_mu phi))) delta phi + partial_mu (pdv(cal(L), (partial_mu phi)) delta phi)} & "上の計算を代入" \
$
作用積分が収束するには場$phi$が遠方では急速に0に近づく必要があるから、無限遠の値を参照する表面積分の項は0となる。また、変分$delta phi$は任意であるから、変分法の原理より$delta phi$の係数は常に0である。したがって
$
  pdv(cal(L), phi) - partial_mu (pdv(cal(L), (partial_mu phi))) = 0
$

- Noerther's Theorem の計算

作用積分Sが
$
  S = integral d^4 x cal(L)
$
で与えられているので、何らかの変分に対しラグランジアン密度が
$
  cal(L) -> cal(L)' = cal(L) + alpha partial_mu cal(J)^mu (x)
$
（$alpha$は微小定数）と変化する限りは作用積分は変わらず、したがって運動方程式も不変である。
$
  because S' &= integral d^4 x cal(L) \
             &= integral d^4 x cal(L) + alpha partial_mu cal(J)^mu (x) \
             &= S + alpha integral d^4 x partial_mu cal(J)^mu (x)
$
となるが表面積分は先に見たように0となるからである。

ここで変分
$
  phi(x) -> phi'(x) = phi(x) + alpha Delta phi(x)
$
において、$cal(L)$の変化を見てみよう。先の計算と同様にして
$
  alpha Delta cal(L) &= pdv(cal(L), phi) (alpha Delta phi) + (pdv(cal(L), (partial_mu phi)))partial_mu (alpha Delta phi) \
                     &= alpha partial_mu (pdv(cal(L), (partial_mu phi)) Delta phi)　＋ alpha [pdv(cal(L) , phi) - partial_mu (pdv(cal(L), (partial_mu phi)))] Delta phi
$
と書けるが、第二項はオイラー方程式から0となる。したがって
$
  j^mu (x) := pdv(cal(L), (partial_mu phi)) Delta phi - cal(J)^mu
$
と定めると
$
  partial_mu cal(J)^mu (x) = 0
$
となる。


- (2.15), (2.16)式の導出
$
  phi -> e^(i alpha) phi = (1 + i alpha + Omicron(alpha^2)) phi
$
なので$alpha$が微少量である時、2次の項を無視して(2.15)式を得る。

また
$
cal(L) = |partial_mu phi| ^2 - m^2 |phi|^2
$
のとき、この変分でラグランジアンは変化しないから、
$
  cal(J) = 0
$
であり、
$
  j^mu = pdv(cal(L), (partial_mu phi)) Delta phi + "c.c."
$
を計算することで(2.15)式を得る。（ここでc.c.はComplex conjugate, 複素共役の略で、直前の項の複素共役である。今回$phi$は複素場なので$phi^*$による微分の項が出てくることに注意）

- (2.24)式の導出

$
  phi = 1 / sqrt(2 omega) (a + a^dagger), p = -i sqrt(omega / 2)(a - a^dagger)
$
と
$
  [phi, p] = i
$
より
$
  i &= [phi, p] \
    &= - i/2  [(a + a^dagger), (a - a^dagger)] \
    &= -i/2 {[a^dagger, a] - [a, a^dagger]} \
    &= i [a, a^dagger]
$
となる。したがって
$
[a, a^dagger$ = 1


- (2.25), (2.26)式の意味
クラインゴルドン場を単振動場と同様にフーリエ空間で表したいが、エネルギーが波数に依存することから分かるように、生成消滅演算子$a, a^dagger$も波数に依存する。そこで、$phi, pi$が実場であることを考慮すると、
$
  phi(x) &= integral (d^3p)/(2 pi)^3 1 / sqrt(2 omega_vb(p)) ( a_vb(p) e^(i vb(p) dot vb(x)) + a_vb(p)^dagger e^(- i vb(p) dot vb(x)))  \ 
  pi(x) &= integral (d^3p)/(2 pi)^3 ( -i) sqrt(omega_vb(p) / 2) ( a_vb(p) e^(i vb(p) dot vb(x)) - a_vb(p)^dagger e^(- i vb(p) dot vb(x)))
$
と表せるのである。ただし、意味ありげに出てきた$1 / sqrt(2 omega_vb(p)) "と" ( -i) sqrt(omega_vb(p) / 2)$はこれらが相対論的に不変である（ローレンツ変換で変化しない）ために必要