#import "theme.typ": section-padding, page-top-padding, accent-color, skills-list-marker, skills-list-left-margin, gray-section-color, white-section-color

#let h2(title) = [
  == #title #text(fill: accent-color)[█]
]

#let section-rule = block(above: 0.65em, below: 1.5em)[ #line(length: 100%, stroke: 0.2pt) ]

#let tip(body) = block(
  fill: rgb("#eef6ff"),
  inset: 0.8em,
  radius: 4pt,
  stroke: rgb("#b6d4fe"),
)[
  *Tip:* #body
]

#let block-header(body) = block(
  // Extend just the teal background into the page's top margin.
  outset: (top: page-top-padding),
  below: 1em,
  inset: (
    top: 0.5cm, bottom: 0.95cm,
    left: 1.5cm, right: 1.5cm
  ),
  fill: accent-color,
  text(
    fill: rgb("#f0f0f0"),
    body,
  ),
)

// Shared layout for the two section colors. The marker has no visible content;
// the page background uses it to continue the last section's color to the bottom.
#let section-block(fill, body) = block(
  width: 100%,
  above: 0pt,
  below: 0pt,
  inset: section-padding,
  fill: fill,
  [
    #metadata(fill) <section-background>
    #body
  ],
)

#let block-top-1(body) = section-block(gray-section-color, body)
#let block-top-2(body) = section-block(white-section-color, body)

#let block-company(name, projects) = block(
  inset: (top: 0.5em, bottom: 0.5em, left: 0em, right: 0em),
  [
    #text()[
      #name
      #projects
    ]
  ]
)

#let block-project(intro, role, dates, tech, achievements) = block(
  grid(
  columns: (5fr, 2fr), [
    #text()[
      #intro
    ]
    \
    #if achievements != [] [
      === Key achievements
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

#let profile-title(name, role) = block(below: 2em, inset: (top: 0em))[
  #text(size: 24pt, weight: "semibold", name)

  #block(above: 0.85em)[
    #text(size: 14pt, style: "italic", role)
  ]
]

#let profile-photo(path) = align(right)[
  #image(path, width: 4.5cm)
]

#let skills-column(body, practices: false) = [
  // Local to these skills lists; achievement lists retain their dot markers.
  #set list(marker: text(weight: "bold", fill: accent-color, skills-list-marker))
  #show list.where(): it => block(inset: (
    left: skills-list-left-margin,
    top: 0em,
    bottom: if practices { -1.5em } else { -1em },
  ))[
    #it
  ]
  #body
]

#let info-table(..args) = table(
  inset: 0pt,
  gutter: 1em,
  column-gutter: 1em,
  stroke: 0pt,
  ..args,
)
