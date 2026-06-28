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
preview "to_insert/analisis_polarizacion/circular_plano_focal_angulo_eje_mayor.pdf"
preview "to_insert/analisis_polarizacion/circular_plano_focal_elipticidad.pdf"
preview "to_insert/analisis_polarizacion/lineal_plano_focal_angulo_eje_mayor.pdf"
preview "to_insert/analisis_polarizacion/lineal_plano_focal_elipticidad.pdf"
preview "to_insert/cilindrico/azimutal_incidente_mapa_polarizacion_polar_hot_v1.pdf"
preview "to_insert/cilindrico/azimutal_salida_componentes_hot_v1.pdf"
preview "to_insert/cilindrico/azimutal_salida_mapa_polarizacion_polar_hot_v1.pdf"
preview "to_insert/cilindrico/radial_incidente_mapa_polarizacion_polar_hot_v1.pdf"
preview "to_insert/cilindrico/radial_salida_componentes_hot_v1.pdf"
preview "to_insert/cilindrico/radial_salida_mapa_polarizacion_polar_hot_v1.pdf"
preview "to_insert/circular/circular_incidente_mapa_polarizacion.pdf"
preview "to_insert/circular/circular_plano_focal_componentes.pdf"
preview "to_insert/circular/circular_plano_focal_mapa_polarizacion.pdf"
preview "to_insert/lineal/lineal_incidente_mapa_polarizacion.pdf"
preview "to_insert/lineal/lineal_plano_focal_componentes.pdf"
preview "to_insert/lineal/lineal_plano_focal_mapa_polarizacion.pdf"
