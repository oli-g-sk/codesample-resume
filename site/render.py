"""Build build/public with Python 3.8+ and GitHub's Markdown API; no packages needed.

Run `python site/render.py` from any directory. GITHUB_TOKEN is optional locally
and supplied by Actions; GITHUB_REPOSITORY supplies the Markdown link context.
README.md and PROJECTS.md supply /cv/ and /projects/. The welcome page is HTML.
Edit index.html for welcome copy, page.html for the shared Markdown page wrapper,
and style.css for presentation. No Markdown content is duplicated in HTML.
The publish workflow combines this output with the existing Windows-built PDF.
"""

import json
import os
from pathlib import Path
import shutil
from string import Template
from urllib.request import Request, urlopen


def render_markdown(markdown):
    headers = {
        "Accept": "text/html",
        "Content-Type": "application/json",
        "User-Agent": "cv-pages-build",
        "X-GitHub-Api-Version": "2022-11-28",
    }
    if token := os.environ.get("GITHUB_TOKEN"):
        headers["Authorization"] = f"Bearer {token}"
    request = Request(
        "https://api.github.com/markdown",
        data=json.dumps({
            "text": markdown,
            "mode": "gfm",
            "context": os.environ.get("GITHUB_REPOSITORY", "oli-g-sk/my-cv"),
        }).encode("utf-8"),
        headers=headers,
        method="POST",
    )
    with urlopen(request, timeout=60) as response:
        content = response.read().decode("utf-8")
    if not content.strip():
        raise RuntimeError("GitHub returned empty Markdown HTML.")
    return content


def main():
    root = Path(__file__).resolve().parents[1]
    source = root / "site"
    output = root / "build" / "public"
    output.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(source / "index.html", output / "index.html")
    shutil.copyfile(source / "style.css", output / "style.css")
    template = Template((source / "page.html").read_text(encoding="utf-8"))

    for filename, slug, title, description in (
        ("README.md", "cv", "CV", "Oliver's CV and resume download."),
        ("PROJECTS.md", "projects", "Projects", "Oliver's personal projects."),
    ):
        markdown = (root / filename).read_text(encoding="utf-8")
        # Keep the README intact and the PDF at its existing public /cv.pdf URL.
        if filename == "README.md":
            markdown = markdown.replace(
                "https://oli-g-sk.github.io/this-is-my-cv/cv.pdf", "../cv.pdf"
            )
        page = template.substitute(
            title=title,
            description=description,
            content=render_markdown(markdown),
            cv_current=' aria-current="page"' if slug == "cv" else "",
            projects_current=' aria-current="page"' if slug == "projects" else "",
        )
        destination = output / slug / "index.html"
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_text(page, encoding="utf-8")
        print(f"Rendered {filename} to {destination}")


if __name__ == "__main__":
    main()
