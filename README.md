# Undergraduate Thesis

This repository contains the LaTeX source, figures, and bibliography for my undergraduate thesis.

## Main Files

- `main.tex`: Main LaTeX entry point
- `chapters/`: Thesis chapters split into separate files
- `appendices/`: Appendix content
- `figures/`: Images and plots used in the document
- `bibliography.bib`: Bibliography database

## Build

The default build uses compressed previews of every raster or PDF figure:

```sh
latexmk -pdf main.tex
```

Use the final entry point to embed the original, full-quality figures:

```sh
latexmk -pdf main-final.tex
```

Optimized previews live in `figures/fast/`. They are derived assets; the original
figures remain the source of truth for the final document. `latexmk` regenerates
only previews whose original files have changed. ImageMagick's `magick` command
is required to create missing previews; without it, an existing stale preview is
kept with a warning.
