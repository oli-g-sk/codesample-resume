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

#let block-company(name, projects) = block(
  inset: (top: 0.5em, bottom: 0.5em, left: 0em, right: 0.75em),
  [
    #text()[
      == #name
      #projects
    ]
  ]
)

#let block-project(intro, role, dates, tech, achievements) = block(
  grid(
  columns: (5fr, 2fr), [
    #text()[
      #intro
    ],
    \
    === Key achievements
    #text()[
      #achievements
    ]
  ],
  [
    #block(
       inset: (top: 0em, bottom: 0.5em, left: 1.75em, right: 0.75em),
        [
          #align(right)[
            #table(
              stroke: 0em,
              inset: 0em,
              row-gutter: 0.75em,
              columns: 1fr,
              [*#role*],
              [#block(inset: (bottom: 0.5em))[
                *#dates*,
              ]],
              section-rule,
              [#block(inset: (top: 0.5em))[
                #emph(tech)
              ]]
            )
          ]
        ]
    )
  ]
  ),
)

#let block-role(role, dates, tech) = block(
  //stroke: 0.1em,
  inset: (top: 0.5em, bottom: 0.5em, left: 1.75em, right: 0.75em),
  [
    #align(right)[
      #table(
        stroke: 0em,
        inset: 0em,
        row-gutter: 0.75em,
        columns: 1fr,
        [*#role*],
        [#block(inset: (bottom: 0.5em))[
          *#dates*
        ]],
        section-rule,
        [#block(inset: (top: 0.5em))[
          #emph(tech)
        ]]
      )
    ]
  ]
)