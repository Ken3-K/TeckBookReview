#import "@preview/physica:0.9.5": *
#set text(font: "Hiragino Kaku Gothic ProN")

= ゲージ理論

標準理論に出てくるゲージ理論では、SU(3), SU(2), U(1)がある。これらの物理的な解釈を空間回転を表すSO(N)と併せて見ていく。

== 空間回転:　特殊直交群 SO(3)
SO(N)はゲージ変換ではないが、身近な回転群である。自由度は$ N(N-1)/2$ と表せる。SO(3)は3次元空間における回転を表す。SO(3)の生成子は次の3つである。
$
J_x equiv mat(
  delim: "(",
  0, 0, 0;
  0, 0, -i;
  0, i, 0
), quad
J_y equiv mat(
  delim: "(",
  0, 0, i;
  0, 0, 0;
  -i, 0, 0
), quad
J_z equiv mat(
  delim: "(",
  0, -i, 0;
  i, 0, 0;
  0, 0, 0
)
$
微小回転の演算子は
$
  R_i = exp(i J_i theta)
$
と表せるが、これは  $theta << 1$の時
$
  R_z = mat(
    cos theta, sin theta, 0;
    -sin theta, cos theta, 0;
    0, 0, 1
    )
  approx mat(
    1, theta, 0;
    -theta, 1, 0;
    0, 0, 1
  )
$
であることに対応する。


== 特殊ユニタリ群 SU(N)
本題のsU(N)についてである。自由度は$N^2 - 1$で表せられる。