#!/bin/bash -l

#SBATCH -A snic2021-5-20
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 4:00:00
#SBATCH -J linkage_map_lepmap_bin
#SBATCH -e linkage_map_lepmap_bin.error
#SBATCH --mail-user karin.nasvall@ebc.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools

PROG_DIR=/proj/uppstore2017185/b2014034_nobackup/Karin/programs
OUTPUT_DIR=/proj/uppstore2017185/b2014034_nobackup/Karin/link_map/output/07_LepMak3r_cat_211220/

cd $OUTPUT_DIR

java -Xmx2048m -cp $PROG_DIR/lep-map3-code/bin/ OrderMarkers2 data=data_f_filt.call map=bin.map_filt recombination1=0 recombination2=0 outputPhasedData=4 > bin.map_order 2> bin.map_order.log

awk -f additional_scripts/order2data.awk bin.map_order > bin.map_order.call

awk '(NR==FNR && NR<8) {print $0} (NR!=FNR){print}' data_f_filt.call bin.map_order.call |gzip > bin.map_order_header.call.gz
