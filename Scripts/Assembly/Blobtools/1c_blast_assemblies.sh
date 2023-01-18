#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 200:00:00
#SBATCH -J blast

module load bioinfo-tools
module load blast/2.10.1+

FASTA=P14502_103.FINAL-deduped-nuc

cp /proj/uppoff2020002/private/group_member_backups/LarsH/HiC_ASSEMBLY_V1.2/DEDUPED/$FASTA.* $SNIC_TMP

cd $SNIC_TMP

blastn \
        -query $FASTA.fasta \
        -db nt \
        -outfmt "6 qseqid staxids bitscore" \
        -max_target_seqs 10 \
        -max_hsps 1 \
        -evalue 1e-25 \
        -num_threads 4 \
        -out $FASTA.out

cp *out /proj/uppoff2020002/private/group_member_backups/LarsH/BLOBTOOLS/BLAST
