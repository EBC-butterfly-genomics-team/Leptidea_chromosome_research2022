#!/bin/bash -l
#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 2:00:00
#SBATCH -J assembly_stats

# get assembly stats (gc, scaffold N stats etc.)
# calculates per position mean coverage from bam file

module load bioinfo-tools
module load samtools/1.10
module load bbmap/38.61b

ASSEMBLY=P14502_103

FASTA=$ASSEMBLY.FINAL-deduped-nuc
BAM=$ASSEMBLY-unique-q30-sorted.deduped
MAIN_PATH=/proj/uppoff2020002/private/group_member_backups/LarsH

cd $MAIN_PATH/HiC_ASSEMBLY_V1.2/DEDUPED
stats.sh in=$FASTA.fasta > $FASTA_stats.txt

cp $MAIN_PATH/BLOBTOOLS/BWA/$BAM.bam $SNIC_TMP
cd $SNIC_TMP

samtools depth -aa $BAM.bam > $BAM.cov

awk '{OFS=""} {sum+=$3} END {print "Number of positions = ",NR,"\n","Mean coverage = ",sum/NR}' $BAM.cov > $BAM.mean.txt

cp $BAM.mean.txt $BAM.cov $MAIN_PATH/BLOBTOOLS/BWA
