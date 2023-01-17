#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 4:00:00
#SBATCH -J maker_merge

module load bioinfo-tools
module load maker/3.01.04


# remake index before merging
# export augustus on second round

export AUGUSTUS_CONFIG_PATH=/home/larshook/LarsH/MAKER/SIN_Swe/Augustus/augustus_config
maker -dsindex -base LMC_P14502_103.FINAL-deduped-nuc -g /home/larshook/LarsH/HiC_ASSEMBLY_LM_corrected/FINAL/LMC_P14502_103.FINAL-deduped-nuc.fasta

# merge output

fasta_merge \
	-d LMC_P14502_103.FINAL-deduped-nuc.maker.output/LMC_P14502_103.FINAL-deduped-nuc_master_datastore_index.log

gff3_merge \
	-s -d LMC_P14502_103.FINAL-deduped-nuc.maker.output/LMC_P14502_103.FINAL-deduped-nuc_master_datastore_index.log > LMC_P14502_103.FINAL-deduped-nuc.all.maker.gff

gff3_merge \
	-n -s -d LMC_P14502_103.FINAL-deduped-nuc.maker.output/LMC_P14502_103.FINAL-deduped-nuc_master_datastore_index.log > LMC_P14502_103.FINAL-deduped-nuc.all.maker.noseq.gff
