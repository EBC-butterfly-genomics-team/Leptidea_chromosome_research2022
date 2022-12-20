#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 30:00
#SBATCH -J BBmap_dedupe

# this script runs BBmap dedup.sh to remove duplicated scaffolds in assemblies

module load bioinfo-tools
module load bbmap/38.61b

# change according to assembly

FASTA=P14502_103
GENOME_PATH=/proj/uppoff2020002/private/group_member_backups/LarsH/HiC_ASSEMBLY_V1.2

# copy files to snic_tmp

cp $GENOME_PATH/$FASTA.fasta $SNIC_TMP
cd $SNIC_TMP


dedupe.sh \
	in=$FASTA.fasta \
	out=$FASTA-deduped.fasta \
	outd=$FASTA-removed_duplicates.fasta
	absorbcontainment=t \
	minidentity=100

cp $FASTA-deduped.fasta $FASTA-removed_duplicates.fasta $GENOME_PATH/DEDUPED
