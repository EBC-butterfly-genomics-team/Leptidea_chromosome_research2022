#!/bin/bash -l
#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 5
#SBATCH -t 80:00:00
#SBATCH -J repeat_modeler

module load bioinfo-tools
module load RepeatModeler/1.0.11



FASTA=P14502_103
MAIN_PATH=/proj/uppoff2020002/private/group_member_backups/LarsH 

cd $MAIN_PATH
mkdir -p REPEATS

cp $MAIN_PATH/HiC_ASSEMBLY_V1.2/DEDUPED/$FASTA.FINAL-deduped-nuc.fasta $SNIC_TMP

cd $SNIC_TMP

BuildDatabase \
        -name $FASTA \
        -engine ncbi \
        $FASTA.FINAL-deduped-nuc.fasta

RepeatModeler \
        -pa 5 \
        -engine ncbi \
        -database $FASTA

cp *families* $MAIN_PATH/REPEATS/
