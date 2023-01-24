#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J mummer

module load bioinfo-tools
module load MUMmer/4.0.0rc1

REFERENCE=P14502_103_CHR
QUERY=P14502_104_CHR


cp /home/larshook/LarsH/HiC_ASSEMBLY_LM_corrected/FINAL/"$REFERENCE".fasta $SNIC_TMP
cp /home/larshook/LarsH/HiC_ASSEMBLY_LM_corrected/FINAL/"$QUERY".fasta $SNIC_TMP


cd $SNIC_TMP


nucmer \
        --prefix="$REFERENCE"-"$QUERY" \
        --threads=2 \
        "$REFERENCE".fasta \
        "$QUERY".fasta

delta-filter \
	-1 \
	"$REFERENCE"-"$QUERY".delta > "$REFERENCE"-"$QUERY"-filtered_1.delta

#show-coords \
#       -c \
#       "$REFERENCE"-"$QUERY"-filtered_1.delta > "$REFERENCE"-"$QUERY"-filtered_1.delta.coords




cp *.delta *.coords /home/larshook/LarsH/WHOLE_GENOME_ALIGNMENTS/BREAKPOINT_ANALYSIS
