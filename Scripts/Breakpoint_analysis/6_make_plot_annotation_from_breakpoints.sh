#!/bin/bash

# make breakpoint annotations for individual chromosome plots
# use breakpoint coordinates file for each assembly as input

# run: ./make_plot_annotation_from_breakpoints.sh <breakpoint_coordinates.file>

cd /home/larshook/LarsH/WHOLE_GENOME_ALIGNMENTS/BREAKPOINT_ANALYSIS

printf "chr fi_swe fi_spa fi_rea fi_anc_sin fu_swe fu_spa fu_rea fu_anc_sin fi_juv_spa\n" > "$1"_plot_annotation

awk '{if ($4=="fi_swe") print $1, $2, "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA""\n"$1, $3, "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA"; \
	else if ($4=="fi_spa") print $1, "NA", $2, "NA", "NA", "NA", "NA", "NA", "NA", "NA""\n"$1, "NA", $3, "NA", "NA", "NA", "NA", "NA", "NA", "NA"; \
	else if ($4=="fi_rea") print $1, "NA", "NA", $2, "NA", "NA", "NA", "NA", "NA", "NA""\n"$1, "NA", "NA", $3, "NA", "NA", "NA", "NA", "NA", "NA"; \
	else if ($4=="fi_anc_sin") print $1, "NA", "NA", "NA", $2, "NA", "NA", "NA", "NA", "NA""\n"$1, "NA", "NA", "NA", $3, "NA", "NA", "NA", "NA", "NA"; \
        else if ($4=="fu_swe") print $1, "NA", "NA", "NA", "NA", $2, "NA", "NA", "NA", "NA""\n"$1, "NA", "NA", "NA", "NA", $3, "NA", "NA", "NA", "NA"; \
        else if ($4=="fu_spa") print $1, "NA", "NA", "NA", "NA", "NA", $2, "NA", "NA", "NA""\n"$1, "NA", "NA", "NA", "NA", "NA", $3, "NA", "NA", "NA"; \
        else if ($4=="fu_rea") print $1, "NA", "NA", "NA", "NA", "NA", "NA", $2, "NA", "NA""\n"$1, "NA", "NA", "NA", "NA", "NA", "NA", $3, "NA", "NA"; \
        else if ($4=="fu_anc_sin") print $1, "NA", "NA", "NA", "NA", "NA", "NA", "NA", $2, "NA""\n"$1, "NA", "NA", "NA", "NA", "NA", "NA", "NA", $3, "NA"; \
        else if ($4=="BR/ILS_juv/spa") print $1, "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", $2"\n"$1, "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", $3}' "$1" |\
		sed 's/chr_//' >> "$1"_plot_annotation
