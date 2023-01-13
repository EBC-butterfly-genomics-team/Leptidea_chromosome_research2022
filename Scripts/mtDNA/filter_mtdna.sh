#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 30:00
#SBATCH -J filter_mtDNA

module load bioinfo-tools
module load biopython


FASTA=P14502_115


GENOME_PATH=/proj/uppoff2020002/private/group_member_backups/LarsH/HiC_ASSEMBLY_V1.2/DEDUPED
ALIGNMENT_PATH=/proj/uppoff2020002/private/group_member_backups/LarsH/MtDNA



# filter output table from alignment by %identity and sum of %coverage per scaffold
awk '$7 > 95 {a[$14] += $10} END {for (i in a) {if (a[i] > 95) print i}}' $ALIGNMENT_PATH$FASTA.FINAL-Circularized_assembly_1_"$FASTA"-rearranged-filtered.coords > $ALIGNMENT_PATH/"$FASTA".mtdna


# use filtered alignment to create new assembly fasta with mtDNA removed
./remove_scaffolds.py \
        $GENOME_PATH/$FASTA.FINAL-deduped.fasta \
        $ALIGNMENT_PATH/$FASTA.mtdna \
        $GENOME_PATH/$FASTA.FINAL-deduped-nuc.fasta
