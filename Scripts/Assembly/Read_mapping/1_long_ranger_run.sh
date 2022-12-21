#!/bin/bash -l
#SBATCH -J LongRanger
#SBATCH -p node
#SBATCH -n 1
#SBATCH -t 10:00:00
#SBATCH -A snic2022-5-34

# load modules
module load bioinfo-tools
module load longranger/2.2.2


# process 10X reads, put barcodes in header etc.


ASSEMBLY=P14502_103

cp /proj/uppstore2017185/b2014034/private/raw_data/Genome_assembly_data/N.Backstrom_19_10/$ASSEMBLY/02-FASTQ/191111_A00621_0145_AHTTMKDSXX/* $SNIC_TMP

cd $SNIC_TMP

longranger basic \
        --id=$ASSEMBLY \
        --fastqs=$SNIC_TMP

cp -r $SNIC_TMP/$ASSEMBLY/ /proj/uppstore2017185/b2014034/private/raw_data/Genome_assembly_data/N.Backstrom_19_10/$ASSEMBLY/


#/home/larshook/LarsH/LongRanger_basic
