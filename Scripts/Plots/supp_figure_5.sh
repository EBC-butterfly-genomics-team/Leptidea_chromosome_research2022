#!/bin/bash

# run this script: ./mummerCoordsDotPlotly_male_female.sh
# requires script mummerCoordsDotPlotly.R


##### coords file needs to be made with show-coords -c   #####

module load bioinfo-tools
module load R_packages


COORDS_PATH=/home/larshook/LarsH/WHOLE_GENOME_ALIGNMENTS/BREAKPOINT_ANALYSIS

P14502_103="L. sinapis Swe male"
P14502_104="L. sinapis Swe female"
P14502_105="L. sinapis Cat male"
P14502_106="L. sinapis Cat female"
P14502_111="L. juvernica male"
P14502_112="L. juvernica female"
P14502_115="L. reali male"
P14502_116="L. reali female"



./mummerCoordsDotPlotly.R \
	-i $COORDS_PATH/P14502_103_CHR-P14502_104_CHR-filtered_1.delta.plot.coords \
	-o LsinSweMaleFemale_alignment \
	-m 1000 \
	-f "$P14502_103" \
	-e "$P14502_104" \
	-s -l -x



./mummerCoordsDotPlotly.R \
        -i $COORDS_PATH/P14502_105_CHR-P14502_106_CHR-filtered_1.delta.plot.coords \
        -o LsinSpaMaleFemale_alignment \
        -m 1000 \
        -f "$P14502_105" \
        -e "$P14502_106" \
        -s -l -x



./mummerCoordsDotPlotly.R \
        -i $COORDS_PATH/P14502_111_CHR-P14502_112_CHR-filtered_1.delta.plot.coords \
        -o LjuvMaleFemale_alignment \
        -m 1000 \
        -f "$P14502_111" \
        -e "$P14502_112" \
        -s -l -x



./mummerCoordsDotPlotly.R \
        -i $COORDS_PATH/P14502_115_CHR-P14502_116_CHR-filtered_1.delta.plot.coords \
        -o LreaMaleFemale_alignment \
        -m 1000 \
        -f "$P14502_115" \
        -e "$P14502_116" \
        -s -l -x


mv *alignment.png /home/larshook/LarsH/ASSEMBLY_MS_PLOTS/

# PARAMETERS:
#
#	-f, --ref 
#		reference axis label
#
#	-e, --que
#		query axis label
#
#	-i INPUT, --input=INPUT
#		coords file from mummer program 'show.coords' [default NULL]
#
#	-o OUTPUT, --output=OUTPUT
#		output filename prefix [default out]
#
#	-v, --verbose
#		Print out all parameter settings [default]
#
#	-q MIN-QUERY-LENGTH, --min-query-length=MIN-QUERY-LENGTH
#		filter queries with total alignments less than cutoff X bp [default 4e+05]
#
#	-m MIN-ALIGNMENT-LENGTH, --min-alignment-length=MIN-ALIGNMENT-LENGTH
#		filter alignments less than cutoff X bp [default 10000]
#
#	-p PLOT-SIZE, --plot-size=PLOT-SIZE
#		plot size X by X inches [default 15]
#
#	-l, --show-horizontal-lines
#		turn on horizontal lines on plot for separating scaffolds  [default FALSE]
#
#	-k NUMBER-REF-CHROMOSOMES, --number-ref-chromosomes=NUMBER-REF-CHROMOSOMES
#		number of sorted reference chromosomes to keep [default all chromosmes]
#
#	-s, --similarity
#		turn on color alignments by percent similarity [default FALSE]
#
#	-t, --identity-on-target
#		turn on calculation of % identity for on-target alignments only [default FALSE]
#
#	-x, --interactive-plot-off
#		turn off production of interactive plotly [default TRUE]
#
#	-r REFERENCE-IDS, --reference-ids=REFERENCE-IDS
#		comma-separated list of reference IDs to keep [default NULL]
#
#	-h, --help
#		Show this help message and exit

