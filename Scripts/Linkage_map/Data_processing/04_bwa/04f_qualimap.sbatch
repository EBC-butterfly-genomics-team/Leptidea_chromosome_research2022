#!/bin/bash -l

#SBATCH -A snic2021-5-20
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 24:00:00
#SBATCH -J linkage_map_lept_ref_qualimap
#SBATCH -e linkage_map_lept_ref_qualimap.error
#SBATCH --mail-user karin.nasvall@ebc.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load R/4.0.0
module load R_packages/4.0.0
module load QualiMap/2.2.1

cd /proj/uppstore2017185/b2014034_nobackup/Karin/link_map/working

OUTPUT_DIR=/proj/uppstore2017185/b2014034_nobackup/Karin/link_map_vanessa/output/04f_qualimap
mkdir $OUTPUT_DIR
mkdir $OUTPUT_DIR/cat
mkdir $OUTPUT_DIR/swe
mkdir $OUTPUT_DIR/cat2
mkdir $OUTPUT_DIR/swe2

unset DISPLAY
qualimap multi-bamqc -c -d input_bam_qualimap_P10854.txt  -outdir $OUTPUT_DIR/cat -r &
qualimap multi-bamqc -c -d input_bam_qualimap_P10853.txt  -outdir $OUTPUT_DIR/swe -r &
qualimap multi-bamqc -c -d input_bam_qualimap_P14461.txt  -outdir $OUTPUT_DIR/cat2 -r &
qualimap multi-bamqc -c -d input_bam_qualimap_P14460.txt  -outdir $OUTPUT_DIR/swe2 -r &
wait

