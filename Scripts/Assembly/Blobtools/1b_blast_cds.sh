#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 1:00:00
#SBATCH -J blast

module load bioinfo-tools
module load blast/2.10.1+

REFERENCE=P14502_103.FINAL-deduped-nuc
QUERY=cds

cp /proj/uppoff2020002/private/group_member_backups/LarsH/HiC_ASSEMBLY_V1.2/DEDUPED/$REFERENCE.* $SNIC_TMP
cp /proj/uppstore2017185/b2014034/NBIS_annotation_leptidea/fasta/$QUERY.fa $SNIC_TMP

cd $SNIC_TMP

blastn \
        -query $QUERY.fasta \
        -db $REFERENCE.fasta \
        -outfmt 6 \
        -max_target_seqs 10 \
        -max_hsps 1 \
        -evalue 1e-25 \
        -num_threads 1 \
        -out $REFERENCE.$QUERY.out

cp *out /proj/uppoff2020002/private/group_member_backups/LarsH/BLOBTOOLS/BLAST
