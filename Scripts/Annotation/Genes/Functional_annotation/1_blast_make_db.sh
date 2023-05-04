#!/bin/bash -l
#SBATCH -J makeblastdb
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 1:00:00
#SBATCH -A snic2022-5-34

module load bioinfo-tools
module load blast/2.11.0+

cp uniprot_sprot.fasta $SNIC_TMP

cd $SNIC_TMP

makeblastdb -in uniprot_sprot.fasta -dbtype prot -title "uniprot_sprot.fasta"

cp *.fasta.* /home/larshook/SCRIPTS/INTERPROSCAN/
