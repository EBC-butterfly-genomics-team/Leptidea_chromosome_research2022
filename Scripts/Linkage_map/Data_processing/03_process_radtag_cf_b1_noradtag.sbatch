#!/bin/bash -l


module load bioinfo-tools
module load Stacks/2.2
module load FastQC/0.11.8
module load MultiQC/1.9

cd link_map/working/

INPUT_PATH=output/02_clone_filter_raw_b1
OUTPUT_PATH=output/03_process_radtag_cf_b1_noradtag

FILE_LIST=list_cf_files_batch1.1.txt

#copy data files to temporary directory
cp $INPUT_PATH/*.fq.gz $SNIC_TMP

input_tmp=$SNIC_TMP
mkdir $SNIC_TMP/output/

for R1 in $(cat $FILE_LIST); do # Loop to iterate over all read 1 files
  R2=$(echo $R1 | sed 's/\.1/\.2/') # Assuming that your R1 and R2 have the same name excepting R1 for R2, assign the right name for R2 to a variable called R2
process_radtags -i gzfastq -1 $input_tmp/$R1 -2 $input_tmp/$R2 -e ecoRI --adapter_1 CTGTCTCTTATA --adapter_2 CTGTCTCTTATA --adapter_mm 2 --disable_rad_check -r -c -q -t 120 -o $SNIC_TMP/output
sleep 1
done
wait

mkdir $OUTPUT_PATH
cp $SNIC_TMP/output/* $OUTPUT_PATH

cd $OUTPUT_PATH
fastqc -t 4 *.{1..2}.{1..2}.fq.gz
multiqc .
