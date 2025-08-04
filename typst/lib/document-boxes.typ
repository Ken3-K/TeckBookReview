// Document Boxes Library
// A collection of styled box functions for academic documents

// Title function
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

// Solution box function with advanced page break handling
#let solution(label: "解答", content) = {
  // Styling config
  let config = (
    fill: rgb("#f8fff8"),
    stroke-color: rgb("#228b22"),
    stroke-width: 2pt,
    radius: 8pt,
    inset: 12pt,
    gap: -15pt,
  )

  // Block factory
  let box(sides, corners, extra-inset, breakable, body) = block(
    fill: config.fill,
    stroke: sides.fold((:), (acc, side) => {
      acc.insert(side, config.stroke-width + config.stroke-color)
      acc
    }),
    radius: corners.fold((:), (acc, corner) => {
      acc.insert(corner, config.radius)
      acc
    }),
    inset: (left: config.inset, right: config.inset, ..extra-inset),
    width: 100%,
    breakable: breakable,
  )[#body]

  // Three-part structure
  box(("top", "left", "right"), ("top",), (top: config.inset, bottom: 8pt), false, [*#label:*])
  v(config.gap)
  box(("left", "right"), (), (top: 8pt, bottom: 8pt), true, content)
  v(config.gap)
  box(("bottom", "left", "right"), ("bottom",), (bottom: config.inset, top: 8pt), false, [])
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

// Definition box function
#let definition(label: "定義", content) = {
  block(
    fill: rgb("#f0f0ff"),
    stroke: 2pt + rgb("#6a5acd"),
    radius: 8pt,
    inset: 12pt,
    width: 100%,
  )[
    *#label:* #content
  ]
}

// Example box function
#let example(label: "例", content) = {
  block(
    fill: rgb("#f5fffa"),
    stroke: 2pt + rgb("#20b2aa"),
    radius: 8pt,
    inset: 12pt,
    width: 100%,
  )[
    *#label:* #content
  ]
}

// Warning box function
#let warning(label: "注意", content) = {
  block(
    fill: rgb("#fff5ee"),
    stroke: 2pt + rgb("#ff4500"),
    radius: 8pt,
    inset: 12pt,
    width: 100%,
  )[
    ⚠️ *#label:* #content
  ]
}
