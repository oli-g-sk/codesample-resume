"""Build build/public with Python 3.8+ and GitHub's Markdown API; no packages needed.

Run `python site/render.py` from any directory. GITHUB_TOKEN is optional locally
and supplied by Actions; GITHUB_REPOSITORY supplies the Markdown link context.
README.md is the only content source. Edit index.html/style.css for presentation.
The publish workflow combines this output with the existing Windows-built PDF.
"""

import json
import os
from pathlib import Path
import shutil
from urllib.request import Request, urlopen


def main():
    root = Path(__file__).resolve().parents[1]
    source = root / "site"
    output = root / "build" / "public"
    markdown = (root / "README.md").read_text(encoding="utf-8")

    # Keep the README intact while fixing its pre-rename Pages URL on the site.
    markdown = markdown.replace(
        "https://oli-g-sk.github.io/this-is-my-cv/cv.pdf", "cv.pdf"
    )
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

    template = (source / "index.html").read_text(encoding="utf-8")
    output.mkdir(parents=True, exist_ok=True)
    (output / "index.html").write_text(
        template.replace("<!-- README -->", content), encoding="utf-8"
    )
    shutil.copyfile(source / "style.css", output / "style.css")
    print(f"Rendered README.md to {output / 'index.html'}")


if __name__ == "__main__":
    main()
