# StandAlone Markdown Editor

A single-file, offline markdown editor that runs in your browser. Open `markdown-editor.html` — no install, no build step, no server.

## How to use

1. Open `markdown-editor.html` in **Chrome** or **Edge** (best File System Access / print support).
2. You start in **Split** view: edit Markdown on the left, preview on the right.
3. Common actions:
   - **Open** — `Ctrl+O` or toolbar
   - **Save** — `Ctrl+S`
   - **Save As** — `Ctrl+Shift+S`
   - **Print / PDF** — `Ctrl+P` or toolbar
   - **Modes** — Markdown, Preview, or Split from the toolbar
4. Print layout (font size, margins, page sheets vs continuous preview) is under the page icon next to Print / PDF.

The file works fully offline after it is on your machine. Document text stays local; preferences like print settings live in the browser’s `localStorage`.

## Windows `.cmd` helpers

These scripts are optional shortcuts for Windows Explorer. They do **not** replace opening the HTML file in a browser.

| File | Purpose |
|------|---------|
| `open-markdown-editor.cmd` | Launches the editor in Edge or Chrome **app mode**. Double-clicked `.md` paths are ignored — use **Ctrl+O** inside the app to load a file. |
| `register-md-open-with.cmd` | Adds **Markdown Editor (StandAloneMD)** to Explorer “Open with” for `.md` / `.markdown` (current user only; no admin). |
| `unregister-md-open-with.cmd` | Removes that “Open with” registration. |

After registering, right-click a `.md` file → **Open with** → **Markdown Editor (StandAloneMD)**. The window opens empty; open the file with **Ctrl+O**.

## License

This project is licensed under the [MIT License](./LICENSE).

## Disclaimer

**Use this software at your own risk.** It is provided as-is, with no warranty of any kind. The authors are not responsible for lost data, incorrect output, security issues, or any other damages arising from use of this software. Always keep backups of important documents.
