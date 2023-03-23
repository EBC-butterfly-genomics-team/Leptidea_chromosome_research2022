#!/bin/bash -l


cd link_map/working/

module load bioinfo-tools
module load Stacks/2.2
module load FastQC/0.11.8
module load MultiQC/1.9

#copy rawdata files to temporary directory
for file in $(cat list_raw_data_path_14460.txt)
do 
cp $file $SNIC_TMP
done
wait

input_path=$SNIC_TMP

output_path=../output/clone_filter_raw_14460/
mkdir $output_path

for R1 in $(cat list_raw_files_R1_14460.txt); do # Loop to iterate over all read 1 files
  R2=$(echo $R1 | sed 's/R1/R2/') # Assuming that your R1 and R2 have the same name excepting R1 for R2, assign the right name for R2 to a variable called R2
  clone_filter -1 $input_path/$R1 -2 $input_path/$R2 -i gzfastq -o $input_path # run clone_filter to each pair-end files
  sleep 1
done
wait

cp $input_path/*.1.fq.gz $output_path
cp $input_path/*.2.fq.gz $output_path 

cd $output_path
fastqc -t 4 *.gz
multiqc .

