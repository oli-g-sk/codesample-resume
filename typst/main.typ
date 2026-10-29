#set document(title: "Oliver Gašpar CV", author: "Oliver Gašpar")
#set page(
  paper: "a4",
)

#import "theme.typ": cv-theme
#import "components.typ": *

#show: cv-theme

#block-header(
  grid(
    columns: (5fr, 3fr), [
      #profile-title[Oliver Gašpar][Senior Software Engineer]
      Brno, *Czech Republic* \

      *Phone*: #link("tel:+421949853547")[+421 949 853 547] \
      *E-mail*: #link("mailto:oliver.g.sk@gmail.com")[oliver.g.sk\@gmail.com] \
      *LinkedIn*: #link("https://www.linkedin.com/in/oliver-gašpar-b8281852")[linkedin.com/in/oliver-gašpar-b8281852] \
      *Github*: #link("https://github.com/oli-g-sk")[github.com/oli-g-sk]
    ],
    [
      #profile-photo("photo.jpg")
    ]
  )
)

#block-top-2(
    grid(
      columns: (5fr, 2fr), [
        = Professional Summary

        Software engineer with *15 years of experience* building *desktop, web, and mobile* applications, primarily in the *.NET ecosystem*.

        I am equally comfortable working across the full stack, from *native UI development* to *backend services* or *API design*.

        I also enjoy *modernizing legacy systems*, reducing technical debt, improving developer workflows, and delivering software that is _intuitive for users_ and _maintainable for engineering_ teams.

        These days, I'm upgrading my workflow by utilizing *cloud-native development practices* and super-charging it with *AI-assisted development _where appropriate_*.      ],
      []
    )
)

#block-top-1(
    grid(
      columns: (5fr, 2fr), [
        #grid(
          columns: (1fr, 1fr),
          gutter: 1.2cm,
          [
            #skills-column[
              == Languages & Frameworks

              - *C\# / .NET* / .NET Framework
              - *ASP.NET Core*, Blazor
              - *REST API*, gRPC, Webhooks
              - Entity Framework / *EF Core*
              - *WPF*, Windows Forms
              - *Avalonia*, MAUI, Xamarin
              - *PostgreSQL*, MS SQL Server
              - *Android SDK*, Flutter
              - *Java*, Kotlin, Dart
              - Spring Boot, JOOQ
              - HTML / CSS
              - JavaScript / TypeScript
              - Unity, Godot
            ]
          ],
          [
            #skills-column(practices: true)[
              == Practices & Tools

              - Model-View-ViewModel (*MVVM*)
              - *Agentic Engineering* (SDD)
              - Test-Driven Development (TDD)
              - Performance Optimization
              - Refactoring, Code Reviews
              - DI, IoC, Mediator Pattern
              - *Git*, *Docker*
              - CI / CD, Github Actions
              - Azure DevOps, Jenkins
              - Jira, Confluence
              - *Codex*, *Claude Code*
              - Automation, no-code, n8n
              - UI / UX Design
            ]
          ],
        )
      ],
      []
    )
)

#block-top-2()[
  = Professional Experience

  #block-company(
    h2("Bagira Systems"),
    [
      #block-project(
        text[
          Worked on *eliminating third-party UI dependencies* (DevExpress) in favor of an in-house UI framework.
        ],
        ".NET Developer",
        "Nov 2025 – Feb 2026",
        "C# / .NET, WPF",
        [
          - Integrated key parts of a *custom WPF framework* into a mission-critical application under a tight deadline.
          - Added meaningful improvements to several custom widgets to support their *long-term usability* and maintainability.
        ]
      )
    ]
  )
]

#block-top-1()[
  #block-company(
    h2("Chyron"),
    [
      #block-project(
        text[
          Worked on the company's *flagship broadcast graphics platform* with a real-time playout system where *reliability and responsiveness* were *_critical_*.
        ],
          ".NET Developer",
          "Sep 2022 – Oct 2025",
          "C# / .NET, WPF, WinForms, ASP.NET Core, gRPC, Jenkins",
          [
            - Delivered *UX and usability improvements* ahead of a major sports event, earning *direct recognition from NBC*.
            - *Refactored operation-critical components*, eliminating a long-standing defect responsible for recurring customer issues.
            - *Improved stability and maintainability* of a *complex hybrid WPF/Windows Forms* application through bug fixes, refactoring, and modernization efforts.
            - Developed new features and maintained production-critical functionality.
            - Contributed to the ongoing migration from Windows Forms to WPF.
            - Created *internal tools* that improved productivity for developers and SQA.
          ],
        )

        #section-rule

        #block-project(
          text[
            Took a major part in building a greenfield project -- *a cloud-oriented platform* exposing the functionality of the company's primary product through web technologies.],
            ".NET Developer",
            "Oct 2021 – Sep 2022",
            "C# / .NET, ASP.NET Core, gRPC, Mapster, xUnit",
            [
              - Developed backend services using *ASP.NET Core*.
              - Implemented *new API endpoints* and exposed them through *gRPC*.
              - *Integrated a major audio-mixing feature* from the previous project.
              - Maintained strong focus on code quality and *test-driven development*.
            ],
          )

          #section-rule

          #block-project(
            text[
              Worked in a small team building a new, specialized product wrapped around the company's established broadcast platform.],
              ".NET Developer",
              "Oct 2020 – Sep 2021",
              "C# / .NET, WPF",
              [
                - *Was responsible for* major parts of the *new UI and features*.
                - Contributed to *engine-level features* and business logic.
              ],
            )
    ],
  )
]

#block-top-2()[
  #block-company(
    h2("Turing Technology"),
    [
    #block-project(
      text[
Worked on multiple short- and long-term *projects across platforms and stacks* in a fast-growing, fintech-focused startup.],
        "Software Developer",
        "Apr 2018 – Sep 2020",
        "C# / .NET, WPF,
        Android SDK, Java, Flutter",
        [
- Independently developed a *native Android* application in Java *from scratch*.
- Delivered a *polished UI* ready for backend integration.
- Joined development of a Forex trading *desktop platform*.
- Led major parts of *WPF UI* implementation and performance optimization.
- Contributed to *architecture decisions* and engineering best practices.
- Experimented with *Flutter* as part of internal research efforts.
        ]
      )
    ]
  )
]

#block-top-1()[
  #block-company(
    h2("EmbedIT"),
    [
    #block-project(
      text[
          Short-term *Android development* engagement involving updating and maintaining an internal native application developed in Java and Kotlin.

  New experience in deploying a production-level product into multiple environments, countries and markets, each carrying its own specifics.],
        "Android Developer",
        "Oct 2019 – Dec 2019",
        "Android SDK, Java",
        []
      )
    ]
  )
]

#block-top-2()[
  #block-company(
    h2("Cleevio"),
    [
    #block-project(
      text[
        Worked on *multiple Android projects* for a well-recognized development house responsible for award-winning apps like Spendee.],
        "Android Developer",
        "Feb 2017 – Aug 2017",
        "Android SDK, Java",
        [
          - *Integrated video advertising* into the mobile application of a *major Czech radio* station.
          - Worked on a new application combining concepts from recruitment platforms and social-media-style stories in a small team of three.
        ]
      )
    ]
  )
]

#block-top-1()[
  #block-company(
    h2("YouWakeMe"),
    [
    #block-project(
      text[
        Developed a *cross-platform mobile app* combining an alarm clock with social media features as part of a *two-person team*.],
        "Android Developer",
        "Apr 2015 – Mar 2018",
        "C# / .NET, Android SDK, Xamarin",
        [
          - *Owned Android implementation* and most platform-specific integrations.
          - Collaborated on UI design, adapting shared designs to Android while *advocating for native Android user experience*.
          - Helped shape a unique concept combining an alarm clock with social networking features.
          - The released app *won both main awards at Czech AppParade 25*.
        ]
      )
    ]
  )
]

#block-top-2()[
  #block-company(
    h2("Masaryk University"),
    [
    #block-project(
      text[Short term assignment during my studies of computer science at the university, and first experience with maintaining real-world, production-grade systems and a relatively high-traffic website.],
        "Web Developer",
        "Mar 2013 – Sep 2013",
        "PHP, HTML, CSS",
        [
          - Developed and maintained public-facing websites for the Faculty of Law.
          - Developed and *maintained internal systems* used by employees and external collaborators.
        ]
      )
    ]
  )
]

#block-top-1()[
  #block-company(
    h2("Freelance Work"),
    [
    #block-project(
      text[
        Maintenance or green-field development of various *web applications* or presentation websites, usually with a *tailor-made lightweight CMS.*, including taking up *most of the UI design* work.],
        "Web Design & Development",
        "2010 – 2013",
        "PHP, HTML, CSS, JavaScript / jQuery, OpenCart, WordPress",
        [
          - A *Slovak equivalent of Groupon* (a local deals aggregator) where I was responsible for the entire front-end and visual design
          - Modernization and maintenance of an *OpenCart-based e-commerce website* for a country-wide retailer of bicycle parts and accessories
          - Redesign of a group of websites for a Prague-based business organizing unique city tours, experiences and stag parties
          - Complete website for a small family tennis-tutoring business
          - Website for local a non-profit helping women with breast cancer
        ]
      )
    ]
  )
]

#block-top-2()[
  #block-company(
    h2("Personal Projects & Open-Source"),
    [
    #block-project(
      text[
        Maintenance or green-field development of various *web applications* or presentation websites, usually with a *tailor-made lightweight CMS.*, including taking up *most of the UI design* work.],
        "Web Design & Development",
        "2010 – 2013",
        "PHP, HTML, CSS, JavaScript / jQuery, OpenCart, WordPress",
        [
          - A *Slovak equivalent of Groupon* (a local deals aggregator) where I was responsible for the entire front-end and visual design
          - Modernization and maintenance of an *OpenCart-based e-commerce website* for a country-wide retailer of bicycle parts and accessories
          - Redesign of a group of websites for a Prague-based business organizing unique city tours, experiences and stag parties
          - Complete website for a small family tennis-tutoring business
          - Website for local a non-profit helping women with breast cancer
        ]
      )
    ]
  )
]

\

#block-top-1()[
#grid(column-gutter: 1em,
  columns: (2fr, 2.5fr),
  [
    = Languages
    #info-table(
      columns: (1fr, 1.5fr),
      [*Language*], [*Level*],
      [English], [Fluent],
      [Slovak], [Native],
      [Czech], [Native],
      [German], [Elementary],
    )
  ],
  [
    = Education
    #info-table(
      columns: (1fr),
      [*Applied Informatics*],
      [Masaryk University, Brno],
      [2009–2014],
    )
  ],
  [

  ]
)
]



