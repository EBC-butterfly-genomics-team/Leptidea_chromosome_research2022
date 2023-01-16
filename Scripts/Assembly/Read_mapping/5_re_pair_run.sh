#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 20:00:00
#SBATCH -J BBmap_repair

module load bioinfo-tools
module load bbmap/38.61b
module load pigz

FASTQ=P14502_103
READ_PATH=/proj/uppoff2020002/private/group_member_backups/LarsH/READ_MAPPING

cd $READ_PATH
mkdir -p Reads_Final

cp $READ_PATH/FastQScreen/$FASTQ.barcoded_R*_val_*.tagged_filter.fastq.gz $SNIC_TMP
cd $SNIC_TMP

repair.sh \
        in1=$FASTQ.barcoded_R1_val_1.tagged_filter.fastq.gz \
	in2=$FASTQ.barcoded_R2_val_2.tagged_filter.fastq.gz \
	out1=$FASTQ.barcoded_R1_final.fq \
	out2=$FASTQ.barcoded_R2_final.fq \
	outs=$FASTQ.barcoded_singeltons_final.fq \
	repair

pigz *final.fq
