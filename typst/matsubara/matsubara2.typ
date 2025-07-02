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
  title: "宇宙論の物理 2章",
  // authors: ("Authors Name",),
  date: datetime.today().display("[day]. [month repr:long] [year]"),
)

= RW計量

ロバートソンウォーカー計量は宇宙時間 $t$と共同座標 $x^i$が直行することなどから次のように定まる。
$
  d s^2 = -d t^2 + a^2(t) gamma _(i j) d x^i d x^j 
$
$gamma_(i j)$を具体的に求めるに極座標を採用する。原点からの距離が一定の2次元球の面積が $4 pi r^2$となるように動径方向の座標 $r$ を定める。空間曲率が0でない限りは$r$と物理的距離は一致しない。また動径方向と球面方向は直交するから
$
  gamma _(i j) d x^i d x^j  = F(r) d r^2 + r^2 (d theta^2 + sin^2 theta d phi.alt^2)
$
となる。
宇宙原理を満たすには3次元スカラー曲率 $attach(R, tl: (3))$が場所によらない定数でなければならない。
$
  attach(R, tl: (3)) = 2 / r d/ (d r)[r (1 - 1/F)]
$
より$attach(R, tl: (3)) = 6 K$とおき、定数$K$を空間曲率とよぶ。
