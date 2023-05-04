#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 1-00:00:00
#SBATCH -J blast

module load bioinfo-tools
module load blast/2.11.0+

QUERY=LMC_P14502_103.FINAL-deduped-nuc.all.maker.proteins

cp /home/larshook/LarsH/MAKER/SIN_Swe/$QUERY.fasta $SNIC_TMP/
cp /home/larshook/SCRIPTS/INTERPROSCAN/uniprot_sprot* $SNIC_TMP/

cd $SNIC_TMP

blastp \
        -query $QUERY.fasta \
        -db uniprot_sprot.fasta \
        -outfmt 6 \
        -evalue 1e-6 \
        -max_hsps 1 \
        -max_target_seqs 1 \
        -out swissprot-$QUERY.out

cp *out /home/larshook/LarsH/INTERPROSCAN/
