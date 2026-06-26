# Make Cheat Sheet

A printable PDF cheat sheet for GNU Make, generated with pandoc and xelatex.

## Quick Start

```bash
make install-fonts  # Install Merriweather font if missing
make build          # Generate build/make-cheatsheet.pdf
make lint           # Lint markdown
make clean          # Remove build artifacts
```

## Prerequisites

- [pandoc](https://pandoc.org/)
- [xelatex](https://www.tug.org/texlive/) (TeX Live)
- Python 3 (for font installer and linting)

### Using devbox

```bash
devbox shell
make build
```

## Fonts

The PDF uses Merriweather (body), DejaVu Sans Mono (code), and Lato (headings).
Run `make install-fonts` to check availability and download Merriweather if missing.
