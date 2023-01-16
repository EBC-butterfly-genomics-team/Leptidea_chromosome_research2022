#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 2:00:00
#SBATCH -J blast

module load bioinfo-tools
module load blast/2.10.1+

REFERENCE=LS_proteins
QUERY=LC_proteins

cp /home/larshook/LarsH/SYNTENY/"$QUERY".fasta $SNIC_TMP
cp /home/larshook/LarsH/SYNTENY/"$REFERENCE".fasta* $SNIC_TMP


cd $SNIC_TMP

blastp \
        -query "$QUERY".fasta \
        -db "$REFERENCE".fasta \
        -outfmt 6 \
        -num_threads 1 \
        -out "$QUERY"_"$REFERENCE".out

cp *out /home/larshook/LarsH/SYNTENY/BLAST
