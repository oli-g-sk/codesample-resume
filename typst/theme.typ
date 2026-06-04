#let cv-theme(body) = [
  #set text(size: 9.5pt, font: "Arial")
  #set list(indent: 0.5em, body-indent: 0.45em)

  #show heading.where(level: 1): it => block(inset: (bottom: 0.5em))[
    #it.body
  ]

  #show heading.where(level: 2): it => block(inset: (top: 0.25em, bottom: 0.2em), sticky: true)[
    #it.body
  ]

  #show list.where(): it => block(inset: (top: 0.25em, bottom: 1em))[
    #it
  ]

  #set par(justify: false)
  #set list(body-indent: 0.75em)

  #set list(marker: "")

  #body
]
