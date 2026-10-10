# Changelog

All notable changes to Inkboard are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.0] - 2026-10-11

### Added

- **Select & copy tool** (`T`). A transparent text layer sits over each PDF page so commands, code and other text can be selected and copied. It is active only while the tool is selected, so it never interferes with the pen, highlighter, laser or eraser.
- **Copy bar** that appears next to a text selection, with two actions:
  - **Copy** copies the text exactly as written.
  - **Copy for terminal** joins wrapped lines and trailing `\` continuations, converts curly quotes to straight quotes, and converts typographic dashes to `-`, so a pasted command runs.
- After copying, Inkboard returns to the tool that was active before, so the flow of a recording or lesson is not interrupted.
- Dragging past the end of a line selects the whole line.
- `docs/sample.pdf`, a small PDF with commands to try the feature on, and a screenshot in the README.
- Project documentation: `CHANGELOG.md`, `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `SECURITY.md`, issue and pull request templates.
- Continuous integration (GitHub Actions) that checks the app script, lints `start.sh`, builds the Docker image and smoke-tests it.
- Dependabot configuration for GitHub Actions and the Docker base image.
- Version shown in the shortcuts panel; OCI image labels in the Dockerfile.

### Changed

- The **Scroll** tool (`V` / `Esc`) is now only for scrolling. Text selection moved to the dedicated Select & copy tool.
- README rewritten with a screenshot, install options, usage guide, browser notes, roadmap and project layout.

## [1.0.0] - 2026-10-09

### Added

- Initial public release.
- PDF viewer built on PDF.js 3.11.174, bundled for fully offline use.
- Laser pointer with a short fading trail.
- Pressure-sensitive pen, highlighter and stroke eraser, with six colours and three widths.
- Disappearing ink that fades two seconds after the pen lifts.
- One-page, two-page and book (cover alone) layouts.
- Blank boards that can be inserted after any page.
- Undo, clear page, zoom, full screen and a "hide tools" mode for clean recordings.
- Three ways to run: Docker (nginx), `./start.sh` (Python), or open `index.html` directly.
- MIT license.

[Unreleased]: https://github.com/bhavukbhardwaj/inkboard/compare/v1.1.0...HEAD
[1.1.0]: https://github.com/bhavukbhardwaj/inkboard/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/bhavukbhardwaj/inkboard/releases/tag/v1.0.0
