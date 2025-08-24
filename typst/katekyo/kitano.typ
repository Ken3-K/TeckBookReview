#import "@preview/physica:0.9.2": *
#set text(font: "Hiragino Kaku Gothic ProN")

= 一粒子の波動関数

== 1. シュレディンガー方程式

粒子の波動関数を $psi$、系のハミルトニアンを $H$ とすると運動方程式として次のシュレディンガー方程式が成り立つ。

$ H psi(r, t) = i hbar pdv(psi(r, t), t) $

粒子の質量を$m$、ポテンシャルを$V(r,t)$とすると

$ H = - hbar^2 / (2m) nabla^2 + V(r, t) $

である。
古典力学では

$ H = p^2/(2m) + V(r,t) $
$ H psi = E psi $

であったので、

$ p -> -i hbar nabla $
$ E -> i hbar pdv(, t) $

という対応があることが分かる。

== 2. エーレンフェストの定理

演算子$hat(A)$の期待値$angle.l hat(A) angle.r$を

$ angle.l hat(A) angle.r = integral d^3 r psi^* hat(A) psi $

で定める。すると、ニュートン力学と同様の方程式が得られる。

$ m (d angle.l r angle.r)/(d t) = angle.l hat(p) angle.r $, $ m (d^2 angle.l r angle.r)/(d t^2) = angle.l F angle.r $

これをエーレンフェストの定理という。

=== 証明

$ angle.l x angle.r = integral d^3 r psi^* x psi $

より

$ (d angle.l x angle.r)/(d t) = integral d^3 r ( pdv(psi^*, t) x psi + psi^* x pdv(psi, t) ) $

ここで、シュレディンガー方程式とそのエルミート共役

$ i hbar pdv(psi, t) = -hbar^2/(2m) nabla^2 psi + V psi $
$ -i hbar pdv(psi^*, t) = -hbar^2/(2m) nabla^2 psi^* + V psi^* $

より

$ (d angle.l x angle.r)/(d t) = integral d^3 r (i hbar)/(2m) ( (nabla^2 psi^*) x psi - psi^* x (nabla^2 psi) ) $
$ = (i hbar)/(2m) integral d^3 r { psi^* x (nabla^2 psi) - (nabla^2 psi^*) x psi } $

ここで

$ pdv(, x, 2) (x psi) = pdv(, x) (psi + x pdv(psi, x)) = 2 pdv(psi, x) + x pdv(psi, x, 2) $

を用いると、

$ psi^* x nabla^2 psi = psi^* nabla^2 (x psi) - 2 psi^* pdv(psi, x) $

と書けるので、これを代入して

$
  (d angle.l x angle.r)/(d t) = (i hbar)/(2m) integral d^3 r { psi^* nabla^2(x psi) - (nabla^2 psi^*) x psi}
  - (i hbar) / m integral d^3 r psi^* pdv(psi, x)
$

となる。右辺第一項はグリーンの定理から、積分領域を囲む曲面での面積分に書ける。波動関数が十分に局在しているとすれば、これは0とみなせる。したがって

$ m (d angle.l x angle.r)/(d t) = integral d^3 r psi^* (-i hbar pdv(, x)) psi = angle.l p_x angle.r $

が成り立つ。

もう一度微分すると

$ m (d^2 angle.l x angle.r)/(d t^2) = -i hbar integral d^3 r ( pdv(psi^*, t) pdv(psi, x) + psi^* pdv(, t)pdv(psi, x) ) $
$
  = - hbar^2/(2m) integral d^3 r ( -(nabla^2 psi^*) pdv(psi, x) + psi^* nabla^2 pdv(psi, x) ) + integral d^3 r psi^* ( -pdv(V, x)) psi
$

右辺第一項はグリーンの定理を用いれば0となることが分かるので、

$ m (d^2 angle.l x angle.r)/(d t^2) = integral d^3 r psi^* (-pdv(V, x)) psi = angle.l F_x angle.r $

$y, z$についても同様に成り立つから、

$ m (d angle.l vb(r) angle.r)/(d t) = angle.l vb(hat(p)) angle.r $
$ m (d^2 angle.l vb(r) angle.r)/(d t^2) = angle.l vb(F) angle.r $

== 3. 箱の中の自由粒子

左図のような一辺がLの箱の中の自由粒子を考える。
シュレディンガー方程式は

$ -hbar^2/(2m) nabla^2 psi = E psi $

境界条件は

$ psi(0, y, z) = psi(L, y, z) = psi(x, 0, z) = psi(x, L, z) = psi(x, y, 0) = psi(x, y, L) = 0 $

である。

$ psi(x, y, z) = X(x)Y(y)Z(z) $

と変数分離できると仮定する。これを代入し$X Y Z$で割ると

$ 1/X (d^2 X)/(d x^2) + 1/Y (d^2 Y)/(d y^2) + 1/Z (d^2 Z)/(d z^2) = -(2 m E)/hbar^2 $

左辺の各項は$x,y,z$の一つのみに依るため、

$ 1/X (d^2 X)/(d x^2) = -k_x^2 $

などを得る。

これの解は

$ X = A cos(k_x x) + B sin(k_x x) $

であるが、境界条件

$X(0)=0$ より $A=0$, $X = B sin(k_x x)$\
$X(L)=0$ より $k_x L = n_x pi$, $k_x = (n_x pi)/L$

i.e. $ X = B sin((n_x pi)/L x). $

Bは規格化係数で

$ 1 = integral_0^L abs(X)^2 d x = abs(B)^2 integral_0^L sin^2((n_x pi)/L x) d x $
$ = abs(B)^2 integral_0^L (1-cos((2n_x pi)/L x))/2 d x = L/2 abs(B)^2 $

より $ B = sqrt(2/L) $。

$Y, Z$についても同様の計算を行い、

$ psi(x, y, z) = sqrt(8/L^3) sin((n_x pi)/L x) sin((n_y pi)/L y) sin((n_z pi)/L z) $

が得られる。また、エネルギー固有値は

$ E = hbar^2/(2m) (k_x^2+k_y^2+k_z^2) = (pi^2 hbar^2)/(2m L^2) (n_x^2+n_y^2+n_z^2) $
ただし、$n_x, n_y, n_z$は任意の整数である。
