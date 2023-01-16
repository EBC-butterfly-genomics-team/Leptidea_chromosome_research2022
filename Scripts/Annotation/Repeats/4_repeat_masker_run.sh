#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J repeat_masker

module load bioinfo-tools
module load RepeatMasker
module load bowtie


FASTA=P14502_103

cd /home/larshook/LarsH/REPEATS/
mkdir -p MASKED

cd /home/larshook/LarsH/REPEATS/MASKED/
mkdir -p "$FASTA"


cp /home/larshook/LarsH/REPEATS/censor_"$FASTA"-families.fa $SNIC_TMP/
cp /home/larshook/LarsH/HiC_ASSEMBLY_LM_corrected/FINAL/"$FASTA".FINAL-deduped-nuc.fasta $SNIC_TMP/
cd $SNIC_TMP/


RepeatMasker \
	-pa 4 \
        -s \
	-gff \
	-xsmall \
        -lib censor_"$FASTA"-families.fa\
        "$FASTA".FINAL-deduped-nuc.fasta


cp * /home/larshook/LarsH/REPEATS/MASKED/"$FASTA"/
