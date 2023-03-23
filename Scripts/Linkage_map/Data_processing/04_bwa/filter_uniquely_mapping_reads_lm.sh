#!/bin/bash -l

#SBATCH -A snic2021-5-20
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 06:00:00
#SBATCH -J linkage_map_lept_ref
#SBATCH -e linkage_map_lept_ref_q10_uniq_noradtag_b2_14460.error
#SBATCH --mail-user karin.nasvall@ebc.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load samtools/1.9

cd /proj/uppstore2017185/b2014034_nobackup/Karin/link_map/working/
INPUT_PATH=/proj/uppoff2020002/private/group_member_backups/KarinN/projects/2018_02_linkmap_lept/output/04b_bwa_b2_14460_noradtag
OUTPUT_PATH=/proj/uppoff2020002/private/group_member_backups/KarinN/projects/2018_02_linkmap_lept/output/04c_bwa_cf_q10_uniq_noradtag_swe

#mkdir $OUTPUT_PATH

#only swedish 
for file in $(ls $OUTPUT_PATH/*.bam)
do
baseFilename=`basename $file .bam`

#samtools view -h -q 10 $file | grep -v -e "XA:Z:" -e "SA:Z:" | samtools view -b -h  > $OUTPUT_PATH/${baseFilename}.bam
samtools flagstat $OUTPUT_PATH/${baseFilename}.bam > $OUTPUT_PATH/${baseFilename}_flagstat.txt 
done
wait
