#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 12:00:00
#SBATCH -J BBmap_reformat

module load bioinfo-tools
module load bbmap/38.61b

# script to de-interleave fastq files generated with long ranger...

# change according to assembly

FASTQ=P14502_106
READ_PATH=/proj/uppstore2017185/b2014034/private/raw_data/Genome_assembly_data/N.Backstrom_19_10/$FASTQ/outs

# copy files to snic_tmp

cp $READ_PATH/$FASTQ.barcoded.fastq.gz $SNIC_TMP
cd $SNIC_TMP



reformat.sh \
	vint \
	in=$FASTQ.barcoded.fastq.gz

reformat.sh \
	in=$FASTQ.barcoded.fastq.gz \
        int=t \
        out=$FASTQ.barcoded_R1.fastq \
        out2=$FASTQ.barcoded_R2.fastq

reformat.sh \
	vpair \
        in=$FASTQ.barcoded_R#.fastq

gzip $FASTQ.barcoded_R1.fastq $FASTQ.barcoded_R2.fastq

cp $SNIC_TMP/*.gz /proj/uppoff2020002/private/group_member_backups/LarsH/READ_MAPPING
