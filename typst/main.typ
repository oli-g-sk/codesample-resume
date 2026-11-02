#set document(title: "Oliver Gašpar CV", author: "Oliver Gašpar")
#set page(
  paper: "a4",
)

#import "theme.typ": cv-theme
#import "components.typ": *

#show: cv-theme


#let heading-padding = (
  left: 1.5cm, right: 1.5cm,
  top: 1cm, bottom: 0cm
)

// #set text(font: "Georgia", size: 11pt)
#set text(font: "Bahnschrift", spacing: 0.35em)

#let section-contact() = block[
    *Phone*: #link("tel:+421949853547")[+421 949 853 547] \
    *E-mail*: #link("mailto:oliver.g.sk@gmail.com")[oliver.g.sk\@gmail.com] \
    *LinkedIn*: #link("https://www.linkedin.com/in/oliver-gašpar-b8281852")[linkedin.com/in/oliver-gašpar-b8281852] \
    *Github*: #link("https://github.com/oli-g-sk")[github.com/oli-g-sk]
]

#block-header(
  grid(
    columns: (2fr, 1fr),
    [
      #profile-title[Oliver Gašpar][Senior Software Engineer][Brno, *Czech Republic*]
      #section-contact()
    ],
    [
      #profile-photo("photo.jpg")
    ]
  )
)

#block(inset: heading-padding)[
  #text(size: 1.8em, fill: accent-color)[
    Introduction
  ]
]

#block-top-2(
    grid(
      columns: (5fr, 2fr), [
        Software engineer with *15 years of experience* building *desktop, web, and mobile* applications, primarily in the *.NET ecosystem*. Equally comfortable working across the full stack, from *native UI development* to *backend services* or *API design*.

        I also enjoy *modernizing legacy systems*, reducing technical debt, improving developer workflows, and delivering software that is both _intuitive for users_ and _maintainable for engineering_ teams.

        These days, I'm upgrading my workflow by utilizing *cloud-native development practices* and super-charging it with *AI-assisted development _where appropriate_*.      ],
      []
    )
)

#block-top-1(
    grid(
      columns: (1), [
        #grid(
          columns: (1fr, 1fr, 1fr),
          gutter: 1.2cm,
          [
            #skills-column(
              "Languages & Tech stack",
              [
                  - *C\# / .NET Core*, Framework
                  - *ASP.NET Core*, Blazor
                  - *REST API*, gRPC, Webhooks
                  - Entity Framework / *EF Core*
                  - *WPF*, Windows Forms
                  - *Avalonia*, MAUI, Xamarin
                  - *PostgreSQL*, MS SQL Server
                  - *Android SDK*, Flutter, Jetpack
                  - *Java*, Spring Boot, JOOQ,
              ]
            )
          ],
          [
            #skills-column("Architecture & Practices",
            [
              - *MVVM* Model-View-ViewModel
              - *Dependency Injection (DI)*
              - Inversion of Control (IoC)
              - *Agentic Engineering*
              - Test-Driven Development
              - Performance Optimization
              - Refactoring, Code Reviews
              - Continuous Integration (CI)
              - UI / UX Design
            ])
          ],
          [
            #skills-column(
              "Tools",
              [
                - *Git*, *Docker*
                - *Codex*, *Claude Code*
                - *Github Actions*
                - *Supabase*
                - Automation, no-code, *n8n*
                - Firebase
                - Sentry
                - Azure DevOps, Jenkins
                - Jira, Confluence
              ]
            )
          ],
        )
      ],
      []
    )
)



#block-top-2()[

  #block(inset: (top:1.6em, bottom: 0.5em))[
    #text(size: 1.8em, fill: accent-color)[
      Professional experience
    ]
  ]

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
          #block(inset: (top: -0em))[
            === PRIME
          ]
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
            #block(inset: (top: -0em))[
              === LIVE
            ]
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
              #block(inset: (top: -0em))[
                === PRIME Switcher
              ]
              Worked in a small team building a new, specialized product wrapped around the company's established broadcast platform.],
              ".NET Developer",
              "Oct 2020 – Sep 2021",
              "C# / .NET, WPF",
              [
                - Had a voice in shaping a brand-new product on top of an established
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
          - Deliveder a small, interactive Android app aimed at children by myself
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
          - *Integrated observability platforms* like Firebase Crashlytics and Sentry
          - *Migrated our version control* system of choice from TFS *to Git*
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
          - Developed and *maintained internal systems* used by the faculty's employees, researchers and external collaborators.
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
        Developed and maintained *web applications* and websites, often with a *custom lightweight CMS*, and handled *most of the UI design* work.],
        "Web Developer",
        "2010 – 2013",
        "PHP, HTML, CSS, JavaScript / jQuery, OpenCart, WordPress",
        [
          - A *Slovak equivalent of Groupon* (a local deals aggregator), for which I handled the entire front end and visual design
          - Modernization and maintenance of an *OpenCart-based e-commerce website* for a nationwide retailer of bicycle parts and accessories
          - Redesign of several websites for a Prague-based business offering city tours, experiences, and stag parties
          - A complete website for a small, family-run tennis coaching business
          - Website for a local non-profit helping women with cancer
        ],
        is-employment: false,
      )
    ]
  )
]

#block-top-2()[
  #block-personal(
    h2("Personal Projects & Open-Source"),
    [
    #block-project(
      text[
        I really love building software in my spare time as well, either to come up with the "next big thing", or because I thought of an interesting technical challenge or experiment to try.
        ],
        "",
        "",
        "",
        [
          - An experimental suite of .NET apps with an *unique approach to getting familiar with a foreign language*. Uses *OpenAI APIs*, and consists mostly of...
            - A *Telegram Bot* that *tranlates* text, *transcribes* voice messages, and *speaks* to you in the language of your choosing
            - A web UI which provides *subtitles for social media content* (Reels, TikToks, YouTube) in the chosen language
            - An *ASP.NET* app serving both above use cases
            - A *desktop GUI* for further fine-tuning the translated content
          - A personal *spending tracking app with an LLM twist*. Cross-platform, made in .NET using *Avalonia*, with *backend-as-a-service* through *Supabase*.
          - *Android app turning* user's favorite *camera roll footage into live wallpapers*, chosen on random on every screen unlock
          - Early-stage *restaurant rating* application with an unique take on the discovery experience, build on the *Java* stack with Spring Boot.
          - A developer-focused *static site generator* (or, a .NET project template) to bootstrap a site on GitHub Pages with minimum effort, backed by *JSON content*
        ],

        is-employment: false,
      )
    ]
  )
]

#block-top-1()[
#grid(column-gutter: 1em,
  columns: (3fr, 2fr, 2fr),
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



