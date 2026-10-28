#let page-margin = (
  top: 0.65cm, bottom: 0.75cm,
  left: 1.5cm, right: 1.5cm
)

#let accent-color = rgb("#125b49")

#let list-marker = block(inset: (top: 0.125em, bottom: 0em))[
  #ellipse(width: 0.3em, height: 0.3em, fill: rgb(128, 128, 128, 255))
]

#let cv-theme(body) = [
  #set text(size: 9.7pt, font: "Arial")
  #set list(indent: 0.5em, body-indent: 0.45em)

  #show heading.where(level: 1): it => block(inset: (bottom: 0.5em))[
    #text()[
      #it.body
    ]
  ]

  #show heading.where(level: 2): it => block(inset: (top: 0.1em, bottom: 0.8em), sticky: true)[
    #text()[
      #it.body
    ]
  ]

  #show heading.where(level: 3): it => block(inset: (top: 0em, bottom: 0.2em), sticky: true)[
    #text()[
      #it.body
    ]
  ]

  #show list.where(): it => block(inset: (top: 0.25em, bottom: 1em))[
    #it
  ]

  #set par(justify: false)
  #set list(body-indent: 0.75em)

  #set list(marker: list-marker)

  #body
]
