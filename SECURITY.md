# Security Policy

## Supported versions

Security fixes are released for the latest minor version.

| Version | Supported |
| ------- | --------- |
| 1.1.x   | Yes       |
| < 1.1   | No        |

## Reporting a vulnerability

Please **do not** open a public issue for security problems.

Report privately using GitHub's [private vulnerability reporting](https://github.com/bhavukbhardwaj/inkboard/security/advisories/new). Include:

- what you found and where,
- steps to reproduce (a sample PDF helps),
- the impact you expect.

You can expect an acknowledgement within 7 days and a status update within 14 days. Once a fix is released, the report will be credited in the release notes unless you prefer otherwise.

## Scope and design notes

Inkboard runs entirely in the browser. PDFs are read locally and are never uploaded. The only external request is the UI font stylesheet from Google Fonts, and the only stored data is the preferred page layout in `localStorage`. Relevant areas for reports include handling of malicious PDFs (PDF.js is bundled in `vendor/pdfjs/` and PDF.js's `isEvalSupported` is disabled), cross-site scripting, and the Docker image and its nginx configuration.

Vulnerabilities in PDF.js itself should also be reported to [Mozilla](https://github.com/mozilla/pdf.js/security); we will update the bundled copy when a fixed release is available.
