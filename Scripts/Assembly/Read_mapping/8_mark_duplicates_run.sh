#!/bin/bash -l
#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 8:00:00
#SBATCH -J mark_duplicates

module load bioinfo-tools
module load GATK/4.1.1.0
module load java/sun_jdk1.8.0_151


BAM=P14502_103-unique-q30-sorted
FASTA=P14502_103.FINAL-deduped-nuc.fasta

cp /proj/uppoff2020002/private/group_member_backups/LarsH/READ_MAPPING/$BAM.bam $SNIC_TMP
#cp /proj/uppoff2020002/private/group_member_backups/LarsH/BLOBTOOLS/BWA/$BAM.bam $SNIC_TMP
cp /proj/uppoff2020002/private/group_member_backups/LarsH/HiC_ASSEMBLY_V1.2/DEDUPED/$FASTA $SNIC_TMP

cd $SNIC_TMP

gatk MarkDuplicates \
        -I $BAM.bam \
        -O $BAM.deduped.bam \
        -M $BAM.dup_metrics.txt \
        --ASSUME_SORT_ORDER coordinate \
        --BARCODE_TAG BC \
        --READ_ONE_BARCODE_TAG BX \
        --READ_TWO_BARCODE_TAG BX \
        --CREATE_INDEX true \
        --REFERENCE_SEQUENCE $FASTA \
        --REMOVE_DUPLICATES true \
        --VERBOSITY INFO

#cp $BAM.deduped.bam $BAM.dup_metrics.txt /proj/uppoff2020002/private/group_member_backups/LarsH/BLOBTOOLS/BWA
cp $BAM.deduped.bam $BAM.dup_metrics.txt /proj/uppoff2020002/private/group_member_backups/LarsH/READ_MAPPING
