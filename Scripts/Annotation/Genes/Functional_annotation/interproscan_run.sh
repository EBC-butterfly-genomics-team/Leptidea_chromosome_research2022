#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 3-00:00:00
#SBATCH -J interpro

module load bioinfo-tools
module load InterProScan/5.30-69.0

cp /home/larshook/LarsH/MAKER/SIN_Swe/LMC_P14502_103.FINAL-deduped-nuc.all.maker.proteins.fasta $SNIC_TMP/

cd $SNIC_TMP

interproscan.sh \
	-dp \
	-i LMC_P14502_103.FINAL-deduped-nuc.all.maker.proteins.fasta \
	-b Lswe \
	-goterms 

cp $SNIC_TMP/* /home/larshook/LarsH/INTERPROSCAN
