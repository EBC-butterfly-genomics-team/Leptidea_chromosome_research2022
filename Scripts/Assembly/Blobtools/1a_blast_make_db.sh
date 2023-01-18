#!/bin/bash -l
#SBATCH -J makeblastdb
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 1:00:00
#SBATCH -A snic2022-5-34

module load bioinfo-tools
module load blast/2.10.1+

cp /proj/uppoff2020002/private/group_member_backups/LarsH/HiC_ASSEMBLY_V1.2/DEDUPED/P14502_1*.FINAL-deduped-nuc.fasta $SNIC_TMP

cd $SNIC_TMP

makeblastdb -in P14502_103.FINAL-deduped-nuc.fasta -dbtype nucl -title "P14502_103.FINAL-deduped-nuc.fasta"
makeblastdb -in P14502_104.FINAL-deduped-nuc.fasta -dbtype nucl -title "P14502_104.FINAL-deduped-nuc.fasta"
makeblastdb -in P14502_105.FINAL-deduped-nuc.fasta -dbtype nucl -title "P14502_105.FINAL-deduped-nuc.fasta"
makeblastdb -in P14502_106.FINAL-deduped-nuc.fasta -dbtype nucl -title "P14502_106.FINAL-deduped-nuc.fasta"
makeblastdb -in P14502_111.FINAL-deduped-nuc.fasta -dbtype nucl -title "P14502_111.FINAL-deduped-nuc.fasta"
makeblastdb -in P14502_112.FINAL-deduped-nuc.fasta -dbtype nucl -title "P14502_112.FINAL-deduped-nuc.fasta"
makeblastdb -in P14502_115.FINAL-deduped-nuc.fasta -dbtype nucl -title "P14502_115.FINAL-deduped-nuc.fasta"
makeblastdb -in P14502_116.FINAL-deduped-nuc.fasta -dbtype nucl -title "P14502_116.FINAL-deduped-nuc.fasta"

cp *.fasta.* /proj/uppoff2020002/private/group_member_backups/LarsH/HiC_ASSEMBLY_V1.2/DEDUPED
