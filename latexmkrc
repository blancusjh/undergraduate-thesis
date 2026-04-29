# Build PDF through XeLaTeX even when invoking latexmk with -pdf.
$pdf_mode = 1;
$pdflatex = 'xelatex -interaction=nonstopmode -halt-on-error %O %S';

# Keep generated compilation artifacts in a dedicated cache folder.
$aux_dir = '.tex-cache';
$out_dir = '.tex-cache';

# Keep final deliverables (like main.pdf) in the project root.
$out2_dir = '.';

# TeX Live compatibility for separate aux/output directories.
$emulate_aux = 1;
