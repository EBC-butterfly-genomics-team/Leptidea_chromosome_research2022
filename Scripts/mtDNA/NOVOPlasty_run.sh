#!/bin/bash -l
#SBATCH -J mtDNA
#SBATCH -p node
#SBATCH -n 1
#SBATCH -C mem256GB
#SBATCH -t 24:00:00
#SBATCH -A snic2022-5-34


module load bioinfo-tools
module load perl


#raw reads
cp /proj/uppstore2017185/b2014034/private/raw_data/Genome_assembly_data/N.Backstrom_19_10/P14502_1*/02-FASTQ/191111_A00621_0145_AHTTMKDSXX/P14502_1*_S*_L004_R*_001.fastq.gz $SNIC_TMP/

#mtDNA seed
cp /home/larshook/SCRIPTS/ASSEMBLY_MS/MtDNA/cox1_morsei.fa $SNIC_TMP/

#script
cp /proj/uppstore2017185/b2014034/nobackup/SOFTWARE/NOVOPlasty/NOVOPlasty4.3.pl $SNIC_TMP/

#config
cp /home/larshook/SCRIPTS/ASSEMBLY_MS/MtDNA/config.txt $SNIC_TMP/

#batch
cp /home/larshook/SCRIPTS/ASSEMBLY_MS/MtDNA/NOVOPlasty_batch_leptidea_10X.txt $SNIC_TMP/


#run NOVOPlasty

cd $SNIC_TMP
perl NOVOPlasty4.3.pl -c _config.txt

#copy output
cp $SNIC_TMP/*.fasta $SNIC_TMP/*.txt /home/larshook/LarsH/MtDNA
