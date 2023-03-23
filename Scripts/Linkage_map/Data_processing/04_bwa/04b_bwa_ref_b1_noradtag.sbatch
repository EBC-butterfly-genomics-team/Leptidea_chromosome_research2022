#!/bin/bash -l

#SBATCH -A snic2021-5-20
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 24:00:00
#SBATCH -J linkage_map_lept_ref
#SBATCH -e linkage_map_lept_ref_bwa_noradtag_b1_cat.error
#SBATCH --mail-user karin.nasvall@ebc.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load samtools/1.9
module load bwa/0.7.17

cd /proj/uppstore2017185/b2014034_nobackup/Karin/link_map/working/

assembly=/proj/uppoff2020002/private/group_member_backups/KarinN/projects/2018_02_linkmap_lept/data/assembly_cat_male/P14502_105.FINAL-deduped-nuc.filtered.fasta
input_path=/proj/uppoff2020002/private/group_member_backups/KarinN/projects/2018_02_linkmap_lept/output/03_process_radtag_cf_b1_noradtag
output_path=/proj/uppoff2020002/private/group_member_backups/KarinN/projects/2018_02_linkmap_lept/output/04b_bwa_bam_b1_cat_noradtag
LIST_FILES=list_filenames_R1_noradtag_b1.txt

#P10853_101_S31_L003.1.1.fq.gz do not want P10853_101_S31_L003.1.rem.1.fq.gz
#copy files to temp directory only cat (P10854)
cp $input_path/P10854*1.1.fq.gz $SNIC_TMP/ &
cp $input_path/P10854*2.2.fq.gz $SNIC_TMP/ &
wait

mkdir $SNIC_TMP/output

for file in $(grep "P10854" $LIST_FILES)
do
baseFilename=`basename $file .1.1.fq.gz`

bwa mem -t 10 -M $assembly $SNIC_TMP/$file $SNIC_TMP/${baseFilename}.2.2.fq.gz | samtools sort - -o $SNIC_TMP/output/${baseFilename}.sorted.bam

done
wait

mkdir $output_path
cp $SNIC_TMP/output/* $output_path/

#bwa
#-t INT nr of threds
#-T INT default quality limit, Don’t output alignment with score lower than INT. This option only affects output. [30]
#-M 	Mark shorter split hits as secondary (for Picard compatibility). 

