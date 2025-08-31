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
  物理学の練習問題
])

// 微分方程式
#problem(feature: "自由落下", [
  自由落下する質量$m$の物体の運動方程式を立て、時刻$t$における速度$v$、位置$y$を求めよ。ただし$t=0$で$v = 0, y = 0$とする。
])
#solution([
  運動方程式は重力加速度を$g$として：
  $ m dv(v, t) = m g $

  これより：
  $ dv(v, t) = g $

  積分して：
  $ v = g t + C_1 $

  初期条件$t=0$で$v=0$より$C_1 = 0$なので：
  $ v = g t $

  位置については：
  $ dv(y, t) = v = g t $

  積分して：
  $ y = 1/2 g t^2 + C_2 $

  初期条件$t=0$で$y=0$より$C_2 = 0$なので：
  $ y = 1/2 g t^2 $

  したがって、時刻$t$における速度と位置は：
  $ v(t) = g t, quad y(t) = 1/2 g t^2 $
])

#pagebreak()

#problem(feature: "上方投射", [
  地面から高さ$H$の場所から、初速度$v_0$で真上に投げ上げられた質量$m$の物体について、最高点に達する時間$t_"h"$と最高到達点の高さ$h$を求めよ。また、物体が地面に戻ってくる時間$t_"return"$を求めよ。
])
#solution([
  鉛直上向きを正の方向として、運動方程式を立てる：
  $ m dv(v, t) = -m g $

  これより：
  $ dv(v, t) = -g $

  積分して：
  $ v = -g t + C_1 $

  初期条件$t=0$で$v=v_0$より$C_1 = v_0$なので：
  $v(t) = - g t + v_0$

  最高点では$v = 0$となるので：
  $ 0 = - g t_"h" + v_0 $
  $ t_"h" = v_0/g $

  位置については：
  $ dv(y, t) = v = - g t + v_0 $

  積分して：
  $ y = - 1/2 g t^2 + v_0 t + C_2 $

  初期条件$t=0$で$y=H$より$C_2 = H$なので：
  $ y(t) = - 1/2 g t^2 + v_0 t + H $

  最高到達点の高さは$t = t_"h" = v_0/g$を代入して：
  $ h = - 1/2 g (v_0/g)^2 + v_0 dot v_0/g + H $
  $ h = - v_0^2/(2g) + v_0^2/g + H $
  $ h = v_0^2/(2g) + H $

  物体が地面に戻るとき$y = 0$なので：
  $ 0 = - 1/2 g t_"return"^2 + v_0 t_"return" + H $
  $ 1/2 g t_"return"^2 - v_0 t_"return" - H = 0 $

  二次方程式の解の公式より：
  $ t_"return" = (v_0 + sqrt(v_0^2 + 2 g H))/g $

  したがって：
  $ t_"h" = v_0/g, quad h = H + v_0^2/(2g), quad t_"return" = (v_0 + sqrt(v_0^2 + 2 g H))/g $
])

#pagebreak()

#problem(feature: "斜方投射", [
  地面から水平面となす角$theta$で初速度$v_0$で投射された質量$m$の物体について、最高点に達する時間$t_h$、最高到達点の高さ$h$、水平到達距離（飛距離）$L$、および飛行時間$t_L$を求めよ。空気抵抗は無視する。水平方向を$x$軸、鉛直上向きを$y$軸の正の方向とする。
])
#solution([

  初速度の成分は：
  $ v_(0x) = v_0 cos theta, quad v_(0y) = v_0 sin theta $

  *水平方向の運動*

  水平方向には力が作用しないので：
  $ m dv(v_x, t) = 0 $
  $ v_x (t) = v_(0x) = v_0 cos theta $
  $ x(t) = integral v_x (t) d t = v_0 cos theta dot t $

  *鉛直方向の運動*

  運動方程式は：
  $ m dv(v_y, t) = -m g $

  これより：
  $ dv(v_y, t) = -g $

  積分して：
  $ v_y (t) = -g t + v_(0y) = -g t + v_0 sin theta $

  位置については：
  $ y(t) = -1/2 g t^2 + v_0 sin theta dot t $

  **最高点に達する時間**
  最高点では$v_y = 0$なので：
  $ 0 = -g t_"h" + v_0 sin theta $
  $ t_"h" = (v_0 sin theta)/g $

  **最高到達点の高さ**
  $t = t_"h"$を代入して：
  $ h = -1/2 g ((v_0 sin theta)/g)^2 + v_0 sin theta dot (v_0 sin theta)/g $
  $ h = (v_0^2 sin^2 theta)/(2g) $

  **飛行時間**
  物体が地面に戻るとき$y = 0$なので：
  $ 0 = -1/2 g t_L^2 + v_0 sin theta dot t_L $
  $ t_L (-1/2 g t_L + v_0 sin theta) = 0 $

  $t_L > 0$なので：
  $ t_L = (2 v_0 sin theta)/g $

  **水平到達距離（飛距離）**
  $ L = x(t_L) = v_0 cos theta dot (2 v_0 sin theta)/g $
  $ L = (2 v_0^2 sin theta cos theta)/g = (v_0^2 sin 2theta)/g $

  したがって：
  $ t_"h" = (v_0 sin theta)/g, quad h = (v_0^2 sin^2 theta)/(2g) $
  $ t_L = (2 v_0 sin theta)/g, quad L = (v_0^2 sin 2theta)/g $
])


#pagebreak()

// エネルギー
#problem(feature: "エネルギー", [
  地面から鉛直方向に質量$m$の小球を速度$v_0$で投げ上げた。空気抵抗はないものとし、時刻$t$における小球の速度$v$, 位置$x$,運動エネルギー$K$, ポテンシャルエネルギー$U$, 全エネルギー$E$を求めよ。ただし、ポテンシャルエネルギーの基準は地面とすること。また、$x$軸は地面を原点とし、鉛直上向きを正の向きとする。
])
#solution([
  鉛直上向きを正の方向として、運動方程式を立てる：
  $ m dv(v, t) = -m g $
  
  これより：
  $ dv(v, t) = -g $
  
  積分して：
  $ v = -g t + C_1 $
  
  初期条件$t=0$で$v=v_0$より$C_1 = v_0$なので：
  $ v(t) = v_0 - g t $
  
  位置については：
  $ dv(x, t) = v = v_0 - g t $
  
  積分して：
  $ x = v_0 t - 1/2 g t^2 + C_2 $
  
  初期条件$t=0$で$x=0$より$C_2 = 0$なので：
  $ x(t) = v_0 t - 1/2 g t^2 $
  
  **エネルギーの計算**
  
  運動エネルギー：
  $ K = 1/2 m v^2 = 1/2 m (v_0 - g t)^2 $
  
  ポテンシャルエネルギー：
  $ U = m g x = m g (v_0 t - 1/2 g t^2) $
  
  全エネルギー：
  $ E = K + U = 1/2 m (v_0 - g t)^2 + m g (v_0 t - 1/2 g t^2) $
  
  展開すると：
  $
    E & = 1/2 m (v_0^2 - 2 v_0 g t + g^2 t^2) + m g v_0 t - 1/2 m g^2 t^2 \
      & = 1/2 m v_0^2 - m v_0 g t + 1/2 m g^2 t^2 + m g v_0 t - 1/2 m g^2 t^2 \
      & = 1/2 m v_0^2
  $
  
  全エネルギーは時間によらず一定値$1/2 m v_0^2$である。これはエネルギー保存則が成り立っていることを示している。
])

// 摩擦
#problem(feature: "摩擦がある時の運動", [
  水平な粗い面上で、質量$m$の物体を初速度$v_0$で押し出したところ、距離$ell$だけ進んで停止した。摩擦係数を$mu$、重力加速度を$g$とする。押し出した方向を$x$の正の向きとして、物体の運動を解析せよ。
])
#solution([
  **力の解析**
  
  物体に働く力：
  - 重力：$m g$（鉛直下向き）
  - 垂直抗力：$N$（鉛直上向き）
  - 摩擦力：$mu N$（運動と逆方向、すなわち$x$の負の向き）
  
  鉛直方向の力の釣り合いより：
  $ N = m g $
  
  **運動方程式**
  
  水平方向（$x$方向）の運動方程式：
  $ m dv(v, t) = -mu N = -mu m g $
  
  これより：
  $ dv(v, t) = -mu g $
  
  積分して：
  $ v = -mu g t + C_1 $
  
  初期条件$t=0$で$v=v_0$より$C_1 = v_0$なので：
  $ v(t) = v_0 - mu g t $
  
  **停止時間の計算**
  
  物体が停止するとき$v = 0$なので：
  $ 0 = v_0 - mu g t_"stop" $
  $ t_"stop" = v_0/(mu g) $
  
  **位置の計算**
  
  $ dv(x, t) = v = v_0 - mu g t $
  
  積分して：
  $ x = v_0 t - 1/2 mu g t^2 + C_2 $
  
  初期条件$t=0$で$x=0$より$C_2 = 0$なので：
  $ x(t) = v_0 t - 1/2 mu g t^2 $
  
  **摩擦係数の計算**
  
  停止時の位置$x(t_"stop") = ell$なので：
  $ ell = v_0 dot v_0/(mu g) - 1/2 mu g (v_0/(mu g))^2 $
  $ ell = v_0^2/(mu g) - 1/2 dot v_0^2/(mu g) $
  $ ell = v_0^2/(2 mu g) $
  
  これより摩擦係数は：
  $ mu = v_0^2/(2 g ell) $
])

#problem(feature: "摩擦熱", [
  上の問題で摩擦による仕事は全て熱に変わったとする。$m = 2.0$ kg, $v_0 = 10$ m/s, $mu = 0.5$の時，発生した摩擦熱$W$ [J]を求めよ。
])
#solution([
  **エネルギー保存則による解法**
  
  初期の運動エネルギーが全て摩擦熱に変換される：
  $ W = 1/2 m v_0^2 $
  
  数値を代入すると：
  $ W = 1/2 times 2.0 times 10^2 = 1/2 times 2.0 times 100 = 100 "J" $
  
  **摩擦力による仕事から求める解法**
  
  まず移動距離を求める：
  $ ell = v_0^2/(2 mu g) = 10^2/(2 times 0.5 times 9.8) = 100/9.8 = 10.2 "m" $
  
  摩擦力は：
  $ f = mu m g = 0.5 times 2.0 times 9.8 = 9.8 "N" $
  
  摩擦による仕事（摩擦熱）は：
  $ W = f times ell = 9.8 times 10.2 = 100 "J" $
  
  したがって、発生した摩擦熱は$W = 100$ Jである。
])