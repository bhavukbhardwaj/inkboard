# Contributing to Inkboard

Thanks for helping. Inkboard is a small, dependency-free web app, and the goal is to keep it that way: one HTML file, no build step, no framework.

By participating you agree to follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## Ways to contribute

- **Report a bug** or **request a feature** with an [issue](https://github.com/bhavukbhardwaj/inkboard/issues/new/choose).
- **Test on your setup.** Reports for Safari, Firefox, Windows, Linux, iPad and specific pen tablets are especially useful.
- **Send a pull request.** For anything larger than a small fix, open an issue first so we can agree on the approach.

## Development setup

You need a browser and either Python 3 or Docker. There is nothing to install.

```bash
git clone https://github.com/bhavukbhardwaj/inkboard.git
cd inkboard
./start.sh                  # http://localhost:8080
# or
docker compose up -d --build
```

Edit `index.html` and reload the browser.

### Project layout

```
index.html            the whole app: HTML, CSS and JavaScript
vendor/pdfjs/         PDF.js (Apache-2.0), bundled for offline use; do not edit
docs/                 screenshot and sample PDF
Dockerfile            nginx image that serves the app
start.sh              run without Docker
.github/              CI, issue and PR templates
```

### Checks to run before opening a PR

CI runs these on every pull request. You can run them locally:

```bash
# 1. The inline script must parse
node -e "const s=require('fs').readFileSync('index.html','utf8');new Function(s.match(/<script>([\s\S]*?)<\/script>\s*<\/body>/)[1]);console.log('ok')"

# 2. Shell script lint (if shellcheck is installed)
shellcheck start.sh

# 3. The image builds and serves the app
docker build -t inkboard:test . && docker run -d --rm -p 8099:80 --name inkboard-test inkboard:test
curl -fsS -o /dev/null http://localhost:8099/ && curl -fsS -o /dev/null http://localhost:8099/vendor/pdfjs/pdf.min.js && echo ok
docker stop inkboard-test
```

Then try your change by hand with `docs/sample.pdf`: draw with the pen, switch tools, select and copy text, and change the page layout. If your change touches input, test it with a mouse and, if you can, a stylus or touch.

## Commit messages

We use [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<optional scope>): <short summary in the imperative>

<body: what changed and why, wrapped at ~72 columns>
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`. Mark breaking changes with `!` after the type (for example `feat!:`) and a `BREAKING CHANGE:` line in the body.

## Pull requests

- Keep each PR focused on one change.
- Fill in the PR template, and include a screenshot or short recording for visible changes.
- Add an entry under `## [Unreleased]` in [CHANGELOG.md](CHANGELOG.md).
- Update the README and the shortcuts panel if you add or change a feature or shortcut.
- Do not commit generated files, secrets, or large binaries.

## Versioning and releases

Inkboard follows [Semantic Versioning](https://semver.org/):

- **MAJOR**: incompatible changes to how it is run or used.
- **MINOR**: new features that keep existing behaviour.
- **PATCH**: bug fixes.

Maintainers cut a release by:

1. Moving the `Unreleased` entries in `CHANGELOG.md` under a new version heading with the date.
2. Updating `VERSION`, the version in the shortcuts panel in `index.html`, and the `version` label in the `Dockerfile`.
3. Committing as `chore(release): X.Y.Z`.
4. Tagging that commit `vX.Y.Z` (annotated) and pushing the tag.
5. Publishing a GitHub Release with the changelog section as the notes.

## License

By contributing you agree that your contributions are licensed under the [MIT License](LICENSE).
