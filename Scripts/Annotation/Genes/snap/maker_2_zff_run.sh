#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 5:00:00
#SBATCH -J maker2zff

module load bioinfo-tools
module load maker/3.01.04

# export gene models from MAKER

maker2zff -x 0.25 -l 50 -d ../../LMC_P14502_103.FINAL-deduped-nuc.maker.output/LMC_P14502_103.FINAL-deduped-nuc_master_datastore_index.log
rename 's/genome/LMC_P14502_103_rnd1.zff.length50_aed0.25/g' *

# get stats and validate
fathom LMC_P14502_103_rnd1.zff.length50_aed0.25.ann LMC_P14502_103_rnd1.zff.length50_aed0.25.dna -gene-stats > gene-stats.log 2>&1
fathom LMC_P14502_103_rnd1.zff.length50_aed0.25.ann LMC_P14502_103_rnd1.zff.length50_aed0.25.dna -validate > validate.log 2>&1

# collect training sequences and annotations, plus 1000 surrounding bp for training
fathom LMC_P14502_103_rnd1.zff.length50_aed0.25.ann LMC_P14502_103_rnd1.zff.length50_aed0.25.dna -categorize 1000 > categorize.log 2>&1
fathom uni.ann uni.dna -export 1000 -plus > uni-plus.log 2>&1

# create training parameters
mkdir params
cd params
forge ../export.ann ../export.dna > ../forge.log 2>&1
cd ..

# assemble HMM
hmm-assembler.pl LMC_P14502_103_rnd1.zff.length50_aed0.25 params > LMC_P14502_103_rnd1.zff.length50_aed0.25.hmm
