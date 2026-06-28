# Build PDF through LuaLaTeX.
$pdf_mode = 4;
$lualatex = 'lualatex -interaction=nonstopmode -file-line-error %O %S';

# NOTE:
# Keep outputs in the project root for stable biblatex/biber runs.

# Ensure biber runs against the default working directory outputs.
$bibtex_use = 2;
$biber = 'biber %O %B';

# Refresh compressed previews only when their full-quality source changes.
my $preview_status = system('./scripts/generate_fast_figures.sh');
die "Could not generate optimized figure previews\n" if $preview_status != 0;
