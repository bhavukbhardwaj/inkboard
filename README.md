# Inkboard

A PDF viewer you can write on while you screen-record or screen-share. Point with a laser, write with your stylus or pen tablet, highlight, and wipe it clean, all in the browser.

Built for teachers, students and anyone explaining a document on camera, especially on macOS where Preview has no live pen or laser tools.

## Features

- **Laser pointer**: a glowing dot that follows your stylus or mouse while hovering, with a short fading trail.
- **Pen**: pressure-sensitive ink with a stylus or pen tablet. While hovering, a small dot shows viewers where you are pointing.
- **Highlighter** and **stroke eraser**.
- **Disappearing ink**: strokes fade two seconds after you lift the pen, so the page stays clean while you talk.
- **Page layouts**: one page, two pages side by side, or book view (cover alone, then 2–3, 4–5…).
- **Select & copy text**: a dedicated tool (`T`) for copying commands, code or any text out of the PDF. Select, then press **Copy** or **Copy for terminal** (one line, straight quotes, plain dashes, so pasted commands run). It switches back to your last tool afterwards, so it never gets in the way of writing.
- **Blank boards**: insert an empty page anywhere to work something out.
- Six colours, three widths, undo, zoom, full screen, and a "hide tools" mode for clean recordings.
- Runs fully offline. Your PDF never leaves your computer.

## Run it

Pick one of these. They all open the same app.

### 1. Docker (works the same everywhere)

```bash
docker compose up -d
```

Open http://localhost:8080. Stop it with `docker compose down`.

Without compose:

```bash
docker build -t inkboard .
docker run -d -p 8080:80 --name inkboard inkboard
```

### 2. One command, no Docker (macOS / Linux)

```bash
./start.sh
```

It serves the folder at http://localhost:8080 and opens your browser. Needs Python 3, which macOS already has.

### 3. Just open the file

Double-click `index.html`. It opens in your browser and works the same way.

## How to use it while recording

1. Open Inkboard in Chrome, Edge, Safari or Firefox.
2. Click **Open PDF**, or drag a PDF onto the window.
3. Pick **1 page**, **2 pages** or **Book** at the top.
4. Press **F** for full screen and **U** to hide the toolbars if you want a clean frame.
5. Start your recorder (QuickTime: File > New Screen Recording, or OBS, Loom, Zoom).
6. Need to copy a command from the PDF? Press **T**, drag over it, then click **Copy for terminal**.
7. Switch with the keyboard while you talk: **L** to point, **P** to write, **D** for disappearing ink.

### Keyboard shortcuts

| Key | Action |
| --- | --- |
| `L` | Laser pointer |
| `P` | Pen |
| `H` | Highlighter |
| `E` | Eraser |
| `V` / `Esc` | Scroll |
| `T` | Select and copy text |
| `1`–`6` | Colours |
| `[` / `]` | Thinner / thicker |
| `D` | Disappearing ink on/off |
| `⌘Z` / `Ctrl+Z` | Undo |
| `C` | Clear this page (`Shift+C` clears all) |
| `B` | Insert a blank page after this one |
| `←` / `→` | Previous / next page (or spread) |
| `+` / `-` / `0` | Zoom in / out / fit |
| `F` | Full screen |
| `U` | Hide or show the toolbars |
| `?` | Show shortcuts |

Hold `⌘`/`Ctrl` and scroll, or pinch on a trackpad, to zoom.

### Stylus tips

- Pressure works when the browser reports the device as a pen. Install your tablet's driver (Wacom, XP-Pen, Huion…). Chrome and Edge give the best pressure support on macOS.
- If your tablet maps to the whole screen, map it to the browser window or one display in the tablet settings for finer control.

## Project layout

```
index.html            the whole app (HTML, CSS, JS in one file)
vendor/pdfjs/         Mozilla PDF.js 3.11.174 (Apache-2.0), bundled for offline use
Dockerfile            nginx image that serves the app
docker-compose.yml    one-command run on port 8080
start.sh              run without Docker using Python's built-in web server
```

There is no build step. Edit `index.html` and reload the browser.

## Notes

- Ink lives in the browser tab. Reloading or opening another PDF clears it.
- Password-protected PDFs aren't supported yet.

## Contributing

Issues and pull requests are welcome. Ideas on the roadmap:

- Save and load annotations alongside the PDF
- Export the annotated PDF
- Shapes and arrows, a text tool
- Spotlight and screen-dim modes

## License

MIT for Inkboard. PDF.js is © Mozilla and contributors under Apache-2.0 (see `vendor/pdfjs/LICENSE`).
