#!/bin/sh
set -eu

preview_dir="figures/fast"
mkdir -p "$preview_dir"

preview() {
  source_file=$1
  source_name=${source_file##*/}
  preview_file="$preview_dir/${source_name%.*}.jpg"

  if [ ! -f "$preview_file" ] || [ "$source_file" -nt "$preview_file" ]; then
    if ! command -v magick >/dev/null 2>&1; then
      if [ -f "$preview_file" ]; then
        echo "Warning: $preview_file is stale; install ImageMagick to refresh it" >&2
        return
      fi

      echo "ImageMagick is required to create missing preview $preview_file" >&2
      exit 1
    fi

    magick "${source_file}[0]" \
      -thumbnail '900x900>' \
      -background white \
      -alpha remove \
      -strip \
      -interlace Plane \
      -quality 62 \
      "$preview_file"
  fi
}

preview "figures/Loss_of_detail_in_small_apertures.jpg"
preview "figures/geometrical_setups/EGs.pdf"
preview "figures/geometrical_setups/s_and_p_polarizations.pdf"
preview "figures/results_of_simulation/fc_analysis/Fc_vs_alpha_polar_exact_left.png"
preview "figures/results_of_simulation/fc_analysis/cartesian_exact_ni2p60_a40_maps.png"
preview "figures/results_of_simulation/fc_analysis/circular_exact_ni2p60_a40_maps.png"
preview "figures/results_of_simulation/fc_analysis/polar_exact_ni2p60_a40_maps.png"
preview "figures/results_of_simulation/general/lithography_pattern_intensities.png"
preview "figures/results_of_simulation/axial_symmetric/analisis_polarizacion/circular_plano_focal_angulo_eje_mayor.pdf"
preview "figures/results_of_simulation/axial_symmetric/analisis_polarizacion/circular_plano_focal_elipticidad.pdf"
preview "figures/results_of_simulation/axial_symmetric/analisis_polarizacion/lineal_plano_focal_angulo_eje_mayor.pdf"
preview "figures/results_of_simulation/axial_symmetric/analisis_polarizacion/lineal_plano_focal_elipticidad.pdf"
preview "figures/results_of_simulation/axial_symmetric/cilindrico/azimutal_incidente_mapa_polarizacion.pdf"
preview "figures/results_of_simulation/axial_symmetric/cilindrico/azimutal_plano_focal_componentes.pdf"
preview "figures/results_of_simulation/axial_symmetric/cilindrico/azimutal_plano_focal_mapa_polarizacion.pdf"
preview "figures/results_of_simulation/axial_symmetric/cilindrico/radial_incidente_mapa_polarizacion.pdf"
preview "figures/results_of_simulation/axial_symmetric/cilindrico/radial_plano_focal_componentes.pdf"
preview "figures/results_of_simulation/axial_symmetric/cilindrico/radial_plano_focal_mapa_polarizacion.pdf"
preview "figures/results_of_simulation/axial_symmetric/circular/circular_incidente_mapa_polarizacion.pdf"
preview "figures/results_of_simulation/axial_symmetric/circular/circular_plano_focal_componentes.pdf"
preview "figures/results_of_simulation/axial_symmetric/circular/circular_plano_focal_mapa_polarizacion.pdf"
preview "figures/results_of_simulation/axial_symmetric/lineal/lineal_incidente_mapa_polarizacion.pdf"
preview "figures/results_of_simulation/axial_symmetric/lineal/lineal_plano_focal_componentes.pdf"
preview "figures/results_of_simulation/axial_symmetric/lineal/lineal_plano_focal_mapa_polarizacion.pdf"
