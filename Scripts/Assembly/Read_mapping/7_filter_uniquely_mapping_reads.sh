#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 10:00:00
#SBATCH -J filter_unique_reads

# use grep to filter uniquely mapped reads, make index.bai and get stats

module load bioinfo-tools
module load samtools/1.10


BAM=P14502_103
MAIN_PATH=/home/larshook/LarsH/READ_MAPPING
#MAIN_PATH=/proj/uppoff2020002/private/group_member_backups/LarsH/BLOBTOOLS/BWA

cp $MAIN_PATH/"$BAM"-sorted.ba* $SNIC_TMP
cd $SNIC_TMP

samtools view -h -@ 2 "$BAM"-sorted.bam | grep -v -e 'XA:Z:' -e 'SA:Z:' | samtools view -b -q 30 -@ 2 > "$BAM"-unique-q30.bam
samtools sort -@ 2 "$BAM"-unique-q30.bam > "$BAM"-unique-q30-sorted.bam
samtools index -@ 2 "$BAM"-unique-q30-sorted.bam "$BAM"-unique-q30-sorted.bai

samtools stats -@ 2 "$BAM"-unique-q30-sorted.bam > "$BAM"-unique-q30-sorted-stats.txt
samtools flagstat -@ 2 -O tsv "$BAM"-unique-q30-sorted.bam > "$BAM"-unique-q30-sorted-flagstats.txt

cp *unique-q30-sorted* $MAIN_PATH/
