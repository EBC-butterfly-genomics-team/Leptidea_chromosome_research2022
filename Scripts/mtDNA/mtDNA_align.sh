#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 5:00:00
#SBATCH -J MUMmer

module load bioinfo-tools
module load MUMmer/4.0.0rc1


REFERENCE=P14502_103.FINAL
QUERY=Circularized_assembly_1_P14502_103-rearranged      


cp /proj/uppoff2020002/private/group_member_backups/LarsH/HiC_ASSEMBLY_V1.2/DEDUPED/$REFERENCE-deduped.fasta $SNIC_TMP
cp /home/larshook/Lars/Leptidea_genome_2020/NOVOPlasty/$QUERY.fasta $SNIC_TMP


cd $SNIC_TMP

nucmer \
        --prefix $REFERENCE-$QUERY \
        -t 1 \
	$REFERENCE-deduped.fasta \
        $QUERY.fasta

delta-filter \
	-g \
	$REFERENCE-$QUERY.delta > $REFERENCE-$QUERY-filtered.delta

show-coords \
	-c \
	-d \
	-g \
	-l \
	-T \
	-r \
	$REFERENCE-$QUERY-filtered.delta > $REFERENCE-$QUERY-filtered.coords

cp $REFERENCE-$QUERY* /proj/uppoff2020002/private/group_member_backups/LarsH/MtDNA/
