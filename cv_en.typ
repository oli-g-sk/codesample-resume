#set document(title: "Oliver Gašpar CV", author: "Oliver Gašpar")
#set page(paper: "a4", margin: (x: 1.5cm, y: 1.35cm))
#set text(size: 9.5pt, font: "Noto Sans")
#set list(indent: 0.5em, body-indent: 0.45em)

#show heading.where(level: 1): it => block(inset: (bottom: 0.5em))[
  #it.body
]

#show heading.where(level: 2): it => block(inset: (top: 0.25em, bottom: 0.2em))[
  #it.body
]

#show list.where(): it => block(inset: (top: 0.25em, bottom: 1em))[
  #it
]

#set par(justify: true)
#set list(body-indent: 0.75em)

#let section-rule = block(above: 3em)[
  #line(length: 100%, stroke: 0.2pt)
]

/* TODO to be used for alt. layout
#grid(
  columns: (1fr, 2fr),
  gutter: 1em,

  [Left column],
  [Right column],
)
*/


#text(size: 18pt, weight: "bold")[Oliver Gašpar] \
#text(size: 11pt)[Senior Software Engineer] \
Brno, Czech Republic \
E-mail: #link("mailto:oliver.g.sk@gmail.com")[oliver.g.sk\@gmail.com] \
LinkedIn: #link("https://www.linkedin.com/in/oliver-gašpar-b8281852")[linkedin.com/in/oliver-gašpar-b8281852]

#section-rule

= Professional Summary

Software engineer with 10+ years of experience building desktop, web, and mobile applications.

My primary expertise is in the .NET ecosystem, with a strong focus on user experience, maintainable architecture, and code quality. I am equally comfortable working across the full stack, from native UI development to backend services, API design, and overall application architecture.

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

#section-rule

#pagebreak()

= Professional Experience


#grid(
  columns: (5fr, 2fr), [
    == Bagira Systems
  ],
  []
)

#grid(
  columns: (5fr, 2fr), [
      Worked on eliminating third-party UI dependencies (DevExpress) in favor of an in-house UI framework.
      
    === Key achievements
    
    - Integrated key parts of a custom WPF framework into a mission-critical application under a tight deadline.
    - Added meaningful improvements to several custom widgets to support their long-term usability and maintainability.
  ],
  [
    #align(right)[
      === C\# / .NET Developer
      *Nov 2025 - Feb 2026*
    ]
  ]
)

#pagebreak()

#grid(
  columns: (5fr, 2fr), [
    == COMPANY
  ],
  []
)

#grid(
  columns: (5fr, 2fr), [
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut faucibus malesuada quam non porta. Donec sapien purus, fermentum sit amet purus eget, egestas aliquam neque. Proin faucibus scelerisque ex vitae eleifend.
    === Key achievements
    - achievement
    - achievement
    - achievement
    - achievement
  ],
  [
    #align(right)[
      === C\# / .NET Developer
      *Jan 1970 - Sep 1999*
    ]
  ]
)

#grid(
  columns: (5fr, 2fr), [
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    === Key achievements
    - achievement
    - achievement
    - achievement
    - achievement
  ],
  [
    #align(right)[
      === C\# / .NET Developer
      *Jan 1970 - Sep 1999*
    ]
  ]
)

#grid(
  columns: (5fr, 2fr), [
    == COMPANY
  ],
  []
)

#grid(
  columns: (5fr, 2fr), [
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut faucibus malesuada quam non porta. Donec sapien purus, fermentum sit amet purus eget, egestas aliquam neque. Proin faucibus scelerisque ex vitae eleifend.
    === Key achievements
    - achievement
    - achievement
    - achievement
    - achievement
  ],
  [
    #align(right)[
      === C\# / .NET Developer
      *Jan 1970 - Sep 1999*
    ]
  ]
)

#grid(
  columns: (5fr, 2fr), [
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    === Key achievements
    - achievement
    - achievement
    - achievement
    - achievement
  ],
  [
    #align(right)[
      === C\# / .NET Developer
      *Jan 1970 - Sep 1999*
    ]
  ]
)

#pagebreak()

== Chyron

=== C\# / .NET Developer
*Oct 2022 - Oct 2025*

Worked on the company's flagship broadcast graphics platform used in live television production.

Key achievements:

- Developed new features and maintained production-critical functionality.
- Performed extensive refactoring and technical debt reduction.
- Created internal tools that improved productivity for developers and support teams.
- Delivered UX and usability improvements that received direct recognition from NBC.
- Worked on both a high-end 3D design environment and a real-time broadcast control system where reliability and responsiveness were critical.

=== C\# / .NET Developer (ASP.NET Core)
*Oct 2021 - Sep 2022*

Worked on a cloud-oriented platform exposing functionality of the company's primary product through web technologies.

Key achievements:

- Developed backend services using ASP.NET Core.
- Implemented new APIs and endpoints.
- Exposed functionality through gRPC services.
- Maintained strong focus on code quality and test-driven development.

=== C\# / .NET Developer (WPF)
*Oct 2020 - Sep 2021*

Worked in a small team building a specialized product based on the company's existing platform.

Key achievements:

- Developed new application functionality beyond the UI layer.
- Contributed to engine-level features and business logic.
- Helped design and implement architecture for a new product experience.

== Turing Technology
=== Software Developer
*Apr 2018 - Sep 2020*

Worked on multiple long-term internal projects.

Key achievements:

- Independently developed a native Android application in Java from scratch.
- Delivered a polished UI ready for backend integration.
- Joined development of a Forex trading desktop platform.
- Led major parts of WPF UI implementation and performance optimization.
- Opportunity to implement UX improvements based on my feedback.
- Contributed to architecture decisions and engineering best practices.
- Experimented with Flutter as part of internal research efforts.

== EmbedIT
=== Android Developer
*Oct 2019 - Dec 2019*

Short-term Android development engagement.

== Cleevio
=== Android Developer
*Feb 2017 - Aug 2017*

Worked on multiple Android projects.

Key achievements:

- Integrated video advertising into the mobile application of a major Czech radio station.
- Worked on a new mobile application combining concepts from recruitment platforms and social-media-style stories.

== YouWakeMe
=== Xamarin Android Developer
*Apr 2015 - Mar 2018*

Developed an award-winning cross-platform mobile application from scratch as part of a two-person team.

Key achievements:

- Collaborated on a shared Xamarin codebase across multiple platforms.
- Owned Android implementation and most platform-specific integrations.
- Collaborated on UI design, adapting shared designs to Android while advocating for Material Design principles and a native Android user experience.
- Utilized Parse as a Backend-as-a-Service (BaaS) platform.
- Took part in defining codebase architecture and selection of tooling.
- Helped shape a unique concept combining an alarm clock with social networking features.
- The app won both main awards at Czech AppParade 25.

== Masaryk University
=== Web Developer
*Mar 2013 - Sep 2013*

Key achievements:

- Maintained and updated public-facing websites for the Faculty of Law.
- Developed and maintained internal systems used by employees and external collaborators.

= Education

== Applied Informatics
Masaryk University, Brno

*2009 - 2014*

= Languages

#table(
  columns: (auto, 1fr),
  inset: 4pt,
  stroke: 0.35pt,
  [*Language*], [*Level*],
  [Slovak], [Native],
  [Czech], [Native],
  [English], [Professional Working Proficiency],
  [German], [Elementary],
)
