
#let section-rule = block(above: 2.75em, below: 2.75em)[
  #line(length: 100%, stroke: 0.2pt)
]

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

#set document(title: "Oliver Gašpar CV", author: "Oliver Gašpar")
#set page(paper: "a4", margin: (x: 1.5cm, y: 1.35cm))
#set text(size: 9.5pt, font: "Noto Sans")
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

/* TODO to be used for alt. layout
#grid(
  columns: (1fr, 2fr),
  gutter: 1em,

  [Left column],
  [Right column],
)
*/


#set list(marker: "")

#grid(
  columns: (5fr, 2fr), [
    #block(below: 2em, inset: (top: 3em))[
      #text(size: 22pt, weight: "semibold")[Oliver Gašpar]
      
      #block(above: 0.85em)[
        #text(size: 14pt, style: "italic")[Senior Software Engineer]
      ]
    ] 
    Brno, *Czech Republic* \
    *E-mail*: #link("mailto:oliver.g.sk@gmail.com")[oliver.g.sk\@gmail.com] \
    *LinkedIn*: #link("https://www.linkedin.com/in/oliver-gašpar-b8281852")[linkedin.com/in/oliver-gašpar-b8281852]
  ],
  [
  ]
)

#section-rule


#set list(marker: list-marker)

#grid(
  columns: (5fr, 2fr), [
    = Professional Summary

    Software engineer with *10+ years of experience* building *desktop, web, and mobile* applications.

    My primary expertise is in the *.NET ecosystem*, with a strong focus on user experience, maintainable architecture, and code quality. I am equally comfortable working across the full stack, from *native UI development* to *backend services*, *API design*, and overall application architecture.
    
    I also enjoy modernizing legacy systems, reducing technical debt, improving developer workflows, and delivering software that is intuitive for users and maintainable for engineering teams.
    
    = Technologies

#grid(
  columns: (1fr, 1fr),
  gutter: 1.2cm,
  [
    #show list.where(): it => block(inset:  (top: 0em, bottom: -1em))[
      #it
    ]
    == Languages & Frameworks

    - C\# / .NET
    - ASP.NET Core
    - REST API, gRPC
    - Entity Framework / EFCore
    - WPF, Windows Forms
    - PostgreSQL
    - SQL Server
    - Java, Kotlin
    - Android SDK
    - Spring Boot
    - Xamarin, Blazor
    - Avalonia, Flutter
    - HTML / CSS
  ],
  [
    == Architecture & Practices

    #show list.where(): it => block(inset: (top: 0em, bottom: -1.5em))[
      #it
    ]

    - Model-View-ViewModel (MVVM)
    - Test-Driven Development (TDD)
    - Performance Optimization
    - Refactoring, Code Reviews
    - UI / UX Design
    - CI / CD

    == Tools
    
    - Git
    - Docker
    - Bitbucket
    - Azure DevOps
    - Jenkins
  ],
)
  ],
  []
)

#section-rule

= Professional Experience

#show heading.where(level: 2): it => block(inset: (top: 0.25em, bottom: 0.2em))[
  #it.body
]

#grid(
  columns: (5fr, 2fr), [
    == Bagira Systems
  ],
  []
)

#grid(
  columns: (5fr, 2fr), [
      Worked on *eliminating third-party UI dependencies* (DevExpress) in favor of an in-house UI framework.
        
      === Key achievements
      
      - Integrated key parts of a *custom WPF framework* into a mission-critical application under a tight deadline.
      - Added meaningful improvements to several custom widgets to support their *long-term usability* and maintainability.
  ],
  [
    #align(right)[
      === C\# / .NET Developer
      
      *Nov 2025 - Feb 2026*
    ]
  ]
)

#grid(
  columns: (5fr, 2fr), [
    == Chyron
  ],
  []
)

#grid(
  columns: (5fr, 2fr), [
Worked on the company's *flagship broadcast graphics platform* centered around a *desktop application* used both for designing and real-time operation. used in live television production (not only) by major U.S. televsion networks..

=== Key achievements

- Developed new features and maintained production-critical functionality.
- Advocated for *technical debt reduction* by doing even small refactorings whenever possible.
- Created *internal tools* that improved productivity for developers and support teams.
- Delivered UX and usability improvements that received direct *recognition from NBC*.
- Worked on both a high-end 3D design environment and a real-time broadcast control system where *reliability and responsiveness* were critical.
  ],
  [
    #align(right)[
      === C\# / .NET Developer
      *Sep 2022 - Oct 2025*
    ]
  ]
)

#grid(
  columns: (5fr, 2fr), [
Took major part in building a greenfield project -- *a cloud-oriented platform* exposing functionality of the company's primary product through web technologies.

=== Key achievements

- Developed backend services using *ASP.NET Core*.
- Implemented *new APIs* and endpoints.
- Exposed functionality through *gRPC*.
- Maintained strong focus on code quality and test-driven development.
  ],
  [
    #align(right)[
      === C\# / .NET Developer
      *Oct 2021 - Sep 2022*
    ]
  ]
)

#grid(
  columns: (5fr, 2fr), [
Worked in a small team building a new, specialized product wrapped around the company's established broadcast platform.

=== Key achievements

- Developed new application functionality beyond the UI layer.
- Contributed to *engine-level features* and business logic.
- Helped design and implement architecture for a new product experience.
  ],
  [
    #align(right)[
      === C\# / .NET Developer
      *Oct 2020 - Sep 2021*
    ]
  ]
)

#grid(
  columns: (5fr, 2fr), [
    == Turing Technology
  ],
  []
)

#grid(
  columns: (5fr, 2fr), [
Worked on multiple short and long term *projects across platforms and stacks* in a fast growing, fintech-focused startup.

=== Key achievements

- Independently developed a *native Android* application in Java *from scratch*.
- Delivered a *polished UI* ready for backend integration.
- Joined development of a Forex trading *desktop platform*.
- Led major parts of *WPF UI* implementation and performance optimization.
- Contributed to *architecture decisions* and engineering best practices.
- Experimented with *Flutter* as part of internal research efforts.
  ],
  [
    #align(right)[
      === Software Developer
      *Apr 2018 - Sep 2020*
    ]
  ]
)

#grid(
  columns: (5fr, 2fr), [
    == EmbedIT
  ],
  []
)

#grid(
  columns: (5fr, 2fr), [
  Short-term Android development engagement involving updatring and maintaing an internal native application developed in Java and Kotlin.
  ],
  [
    #align(right)[
      === Android Developer
      *Oct 2019 - Dec 2019*
    ]
  ]
)

#grid(
  columns: (5fr, 2fr), [
    == Cleevio
  ],
  []
)

#grid(
  columns: (5fr, 2fr), [

Worked on *multiple Android projects* for a well-recognized development house responsible for award winning apps like Spendee.

=== Key achievements

- *Integrated video advertising* into the mobile application of a *major Czech radio* station.
- Worked on a new application combining concepts from recruitment platforms and social-media-style stories in a small team of three.
  ],
  [
    #align(right)[
      === Android Developer
      *Feb 2017 - Aug 2017*
    ]
  ]
)

#grid(
  columns: (5fr, 2fr), [
    == YouWakeMe
  ],
  []
)

#grid(
  columns: (5fr, 2fr), [
Developed a *cross-platform mobile app* combining an alarm clock with social media features as part of a *two-person team*.

=== Key achievements

- Collaborated on a *shared Xamarin codebase*.
- *Owned Android implementation* and most platform-specific integrations.
- Collaborated on UI design, adapting shared designs to Android while *advocating for Material Design principles* and a native Android user experience.
- Utilized Parse as a Backend-as-a-Service (BaaS) platform.
- Helped shape a unique concept combining an alarm clock with social networking features.
- The released app *won both main awards at Czech AppParade 25*.
  ],
  [
    #align(right)[
      === .NET / Android Developer
      *Apr 2015 - Mar 2018*
    ]
  ]
)

#grid(
  columns: (5fr, 2fr), [
    == Masaryk University
  ],
  []
)

#grid(
  columns: (5fr, 2fr), [

- Maintained and updated public-facing websites for the Faculty of Law.
- Developed and *maintained internal systems* used by employees and external collaborators.
  ],
  [
    #align(right)[
      === PHP / Web Developer
      *Mar 2013 - Sep 2013*
    ]
  ]
)

#section-rule

#grid(column-gutter: 1em,
  columns: (2fr, 2.5fr),
  [
    = Languages
    #table(
      columns: (1fr, 1.5fr),
      inset: 0pt,
      gutter: 1em,
      column-gutter: 1em,
      stroke: 0pt,
      [*Language*], [*Level*],
      [English], [Fluent],
      [Slovak], [Native],
      [Czech], [Native],
      [German], [Elementary],
    )
  ],
  [
    = Education
    #table(
      columns: (1fr),
      inset: 0pt,
      gutter: 1em,
      column-gutter: 1em,
      stroke: 0pt,
      [*Applied Informatics*],
      [Masaryk University, Brno],
      [2009-2014]
    )
  ],
  [

  ]
)



