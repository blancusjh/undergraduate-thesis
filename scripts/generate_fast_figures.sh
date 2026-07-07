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
preview "figures/results_of_simulation/fc_analysis/cartesian_exact_ni2p60_a40_maps.png"
preview "figures/results_of_simulation/fc_analysis/circular_exact_ni2p60_a40_maps.png"
preview "figures/results_of_simulation/fc_analysis/polar_exact_ni2p60_a40_maps.png"
preview "figures/results_of_simulation/vecdiff_final/circular/circular_componentes.png"
preview "figures/results_of_simulation/vecdiff_final/circular/circular_mapa_polarizacion.png"
preview "figures/results_of_simulation/vecdiff_final/circular/circular_angulos_elipse.png"
preview "figures/results_of_simulation/vecdiff_final/lineal/lineal_componentes.png"
preview "figures/results_of_simulation/vecdiff_final/lineal/lineal_mapa_polarizacion.png"
preview "figures/results_of_simulation/vecdiff_final/lineal/lineal_angulos_elipse.png"
preview "figures/results_of_simulation/vecdiff_final/cilindrico/radial_componentes.png"
preview "figures/results_of_simulation/vecdiff_final/cilindrico/radial_mapa_polarizacion.png"
preview "figures/results_of_simulation/vecdiff_final/cilindrico/azimutal_componentes.png"
preview "figures/results_of_simulation/vecdiff_final/cilindrico/azimutal_mapa_polarizacion.png"
preview "figures/results_of_simulation/vecdiff_final/litografia/litografia_lineal_imagenes.png"
preview "figures/results_of_simulation/vecdiff_final/litografia/litografia_circular_imagenes.png"
preview "figures/results_of_simulation/vecdiff_final/spot/spot_cortes_principales.png"
preview "figures/results_of_simulation/vecdiff_final/spot/spot_radios_anotados.png"
