#!/bin/bash

# run this script: ./mummerCoordsDotPlotly_run.sh

##### coords file needs to be made with show-coords -c   #####

module load bioinfo-tools
module load R_packages

COORDS_PATH=/home/larshook/LarsH/WHOLE_GENOME_ALIGNMENTS/BREAKPOINT_ANALYSIS

REF=P14502_105
QUE=Lsin_DToL

./mummerCoordsDotPlotly.R \
	-i $COORDS_PATH/"$REF"_CHR-"$QUE"-filtered_1.delta.plot.coords \
	-o "$REF"_CHR-"$QUE"_CHR-filtered_1.delta.plot.coords \
	-m 1000 \
	-f "L. sinapis Catalan" \
	-e "L. sinapis Asturian" \
	-s -l -x
