// Extra breathing room at the top of every page (independent of section padding).
#let page-top-padding = 0.5cm

// Padding inside each gray or white section.
#let section-padding = (
  top: 0.65cm, bottom: 0.75cm,
  left: 1.5cm, right: 1.5cm
)

#let accent-color = rgb("#125b49")
// Marker text for the two skills lists only. Replace "//" with "#", etc.
#let skills-list-marker = "#"
// Marker text for achievement lists. Change independently of the skills marker.
#let achievement-list-marker = "//"
// Shared by skills and achievement lists. Negative values move lists left.
#let skills-list-left-margin = -1.8em
#let gray-section-color = rgb(240, 240, 240)
// Approximately 1px, at half opacity to keep the gray/white boundaries subtle.
#let gray-section-border = 0.75pt + gray-section-color.darken(50%).transparentize(50%)
#let white-section-color = rgb(255, 255, 255)

// Each section leaves an invisible color marker (see section-block in components.typ).
// Find the last section that has started by this page, including a section carried
// over from an earlier page, and continue its color down to the paper edge.
// This changes the background without stretching content or moving page breaks.
#let section-page-background() = context {
  let current-page = here().page()
  let sections = query(<section-background>).filter(section =>
    section.location().page() <= current-page
  )
  // Color the top margin using the section that starts or continues this page.
  // A new section's marker sits just inside its top padding. Later markers belong
  // to sections farther down the page and must not change the color at the top.
  // Page 1 keeps the teal header's own background instead.
  if current-page > 1 {
    let sections-at-top = sections.filter(section => {
      let position = section.location().position()
      position.page < current-page or (
        position.y <= page-top-padding + section-padding.top + 0.01pt
      )
    })
    if sections-at-top.len() > 0 {
      place(top + left, rect(
        width: 100%,
        height: page-top-padding,
        fill: sections-at-top.last().value,
        stroke: none,
      ))
    }
  }

  if sections.len() > 0 {
    let section = sections.last()
    let start = section.location().position()
    let start-y = if start.page == current-page { start.y } else { page-top-padding }
    place(top + left, dy: start-y, rect(
      width: 100%,
      height: 100% - start-y,
      fill: section.value,
      stroke: none,
    ))
  }
}

// Draw separators only where a new section changes the background color.
// The marker is inside the section's padding, so subtract that padding to find
// the actual boundary. Skip page starts: a continuing background has no border.
#let section-page-borders() = context {
  let current-page = here().page()
  let sections = query(<section-background>)
  for (index, section) in sections.enumerate() {
    let position = section.location().position()
    let boundary-y = position.y - section-padding.top
    if index > 0 and position.page == current-page and (
      boundary-y > page-top-padding + 0.01pt
    ) {
      let previous = sections.at(index - 1)
      if previous.value != section.value {
        place(top + left, dy: boundary-y, line(
          length: 100%,
          stroke: gray-section-border,
        ))
      }
    }
  }
}

// Shared marker appearance for skills and achievements. Scaling is visual only,
// so the heavier, larger characters do not increase line spacing.
#let accent-list-marker(symbol) = scale(110%, reflow: false, text(
  weight: "black",
  fill: accent-color,
  // Keep the marker heavy even when Arial falls back to its bold face.
  stroke: 0.12pt + accent-color,
  symbol,
))

#let cv-theme(body) = [
  #set page(
    margin: (top: page-top-padding, bottom: 0pt, x: 0pt),
    background: section-page-background(),
    foreground: section-page-borders(),
  )
  #set text(size: 9.7pt, font: "Arial")
  #set list(indent: 0.5em, body-indent: 0.45em)

  #show heading.where(level: 1): it => block(inset: (bottom: 0.5em))[
    #text()[
      #it.body
    ]
  ]

  // Keep heading spacing explicit; inset controls the padding around the text.
  #show heading.where(level: 2): it => block(
    above: 0pt,
    below: 0pt,
    inset: (top: 0.1em, bottom: 0.8em),
    sticky: true,
  )[
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

  #set list(marker: accent-list-marker(achievement-list-marker))

  #body
]
