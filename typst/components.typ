#let section-rule = block(above: 2.75em, below: 2.75em)[ #line(length: 100%, stroke: 0.2pt) ]

#let list-marker = block(inset: (top: 0.125em, bottom: 0em))[
  #ellipse(width: 0.3em, height: 0.3em, fill: rgb(128, 128, 128, 255))
]

#let tip(body) = block(
  fill: rgb("#eef6ff"),
  inset: 0.8em,
  radius: 4pt,
  stroke: rgb("#b6d4fe"),
)[
  *Tip:* #body
]

#let block-role(role, dates, tech) = block(
  [
    #align(right)[
      #table(
        stroke: 0em,
        inset: 0em,
        row-gutter: 0.75em,
        columns: 1fr,
        [*#role*],
        [*#dates*],
        [#block(inset: (top: 0.5em))[
          #emph(tech)
        ]]
      )
    ]
  ]
)