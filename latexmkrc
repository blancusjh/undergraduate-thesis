# Build PDF through XeLaTeX even when invoking latexmk with -pdf.
$pdf_mode = 1;
$pdflatex = 'xelatex -interaction=nonstopmode -halt-on-error %O %S';

# NOTE:
# Using separate aux/output directories in this project can produce
# malformed .aux state with biblatex in repeated runs. Keep outputs
# in the project root for stable builds.

# Ensure biber runs against the default working directory outputs.
$bibtex_use = 2;
$biber = 'biber %O %B';
