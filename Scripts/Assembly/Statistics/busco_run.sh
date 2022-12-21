#!/bin/bash -l
#SBATCH -J busco
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 25:00:00
#SBATCH -A snic2022-5-34

# runs busco analysis

# load modules
module load bioinfo-tools
module load BUSCO

# cp data to snic_tmp

FASTA=P14503_103_3DDNA

# for pre-correction assemblies...
cp /proj/uppoff2020002/private/raw_data_backups/Leptidea/Genome_assembly_data/HiC_Lars_Hook/delivery03527/INBOX/P14503/01-Results/02-3DDNA/"$FASTA".fasta $SNIC_TMP

# for post-correction assemblies...
#cp /proj/uppoff2020002/private/result_files/Leptidea/Genome_assembly/HiC_assemblies/"$FASTA".fasta $SNIC_TMP


cd $SNIC_TMP

source $BUSCO_SETUP
source $AUGUSTUS_CONFIG_COPY

run_BUSCO.py \
        -m geno \
        -i "$FASTA".fasta \
        -o "$FASTA" \
        -l $BUSCO_LINEAGE_SETS/lepidoptera_odb10 \
        -c 1
        

cp -r $SNIC_TMP/* /home/larshook/LarsH/HiC_ASSEMBLY_LM_corrected/FINAL/BUSCO/BUSCO_RERUN
