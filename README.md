# Hello, I'm Oliver!

If you're reading this, it's likely that I'm actively or passively looking for new opportunities.
You can find more information about me, my coding experience, and personal projects in my CV.

## Build it yourself (recommended)

### Install Typst

You'll need [Typst](https://typst.app/) to compile the document for a better reading experience.
You can install it using one of the options below, based on your OS and package manager of choice.

#### Windows

WinGet

```powershell
winget install --id Typst.Typst -e
```

Chocolatey

```powershell
choco install typst
```

Scoop

```powershell
scoop install typst
```

#### Linux

Follow the [Typst installation instructions](https://typst.app/open-source/#download/).

#### macOS

Homebrew

```bash
brew install typst
```

### Compile the CV

After you (obviously) checkout the repository, run the following command in its root:

```bash
typst compile cv.typ
```

*NOTE*: `typst` has to be on your PATH already. Your package manager probably took care of that, but if not, try opening a new terminal session or signing out from your user profile.

A file called `cv.pdf` will be generated.

## Download

For your convenience (or if you prefer your candidates precompiled), an up-to-date version is available for download.
