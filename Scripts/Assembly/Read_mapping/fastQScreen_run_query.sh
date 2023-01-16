#!/bin/bash -l
#SBATCH -J FQScreen
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 50:00:00
#SBATCH -A snic2022-5-34

# load modules
module load bioinfo-tools
module load fastq_screen/0.11.1
module load bwa/0.7.17

READ1=${1:?msg}                                 #read file name (with path)
READ2=${2:?msg}                               #read file name (without path) 
SRCDIR=${3:?msg}                                #read path to output folder

SRCDIR_INI=$(pwd)                           #remember initial path


Conf_PATH=/home/larshook/SCRIPTS/ASSEMBLY_MS/ASSEMBLY
MAIN_PATH=/proj/uppoff2020002/private/group_member_backups/LarsH/READ_MAPPING

cp $Conf_PATH/fastq_screen.conf $SNIC_TMP
cp $MAIN_PATH/TrimGalore/$READ1 $SNIC_TMP
cp $MAIN_PATH/TrimGalore/$READ2 $SNIC_TMP

cd $SNIC_TMP

fastq_screen \
	--threads 1 \
	--aligner bwa \
	--conf fastq_screen.conf \
	--subset 0 \
	--nohits \
	$READ1 
	$READ2

cp $SNIC_TMP/* $MAIN_PATH/FastQScreen

# notes (fastq_screen): 
# --conf          fastq_screen.conf
# --threads       Specify across how many threads bowtie will be allowed to run. Overrides the default 
#                 value set in the configuration file

#  --aligner      Specify the aligner to use for the mapping. Valid 
#                 arguments are 'bowtie', bowtie2' or 'bwa'.

#  --conf         Location for the configuration file (path to libraries)

#  --outdir       Specify a directory in which to save output files. If no directory is specified then 
#                 output files are saved into the same directory as the input file.

#  --tag	  Creates output fastq file where every single read is tagged, listing to which
# 		  genomes the read did, or did not align. By default, selecting --tag will result in 
#		  the whole file being processed, unless over-ridden by the --subset option.

#  --subset       Don't use the whole sequence file, but create a temporary dataset of this specified 
#                 number of reads. The dataset created will be of approximately (within a factor of 2) 
#                 of this size. If the real dataset is smaller than twice the specified size then the 
#                 whole dataset will be used. Subsets will be taken evenly from throughout the whole 
#                 original dataset. Default is 100000, but to process all the data set --subset to 0.
# --filter        Produce a FASTQ file containing reads mapping to 
#                 specified genomes. Pass the argument a string of
#                 characters (0, 1, 2, 3, -), in which each character 
#                 corresponds to a reference genome (in the order the 
#                 reference genome occurs in the configuration file).  
#                 Below gives an explanation of each character.		
#                 0: Read does not map
#                 1: Read maps uniquely
#                 2: Read multi-maps
#                 3: Read maps (one or more times)
#                 -: Ignore whether a read maps to this genome
#				
#                 Consider mapping to three genomes (A, B and C), the 
#                 string '003' produces a file in which reads do not 
#                 map to genomes A or B, but map (once or more) to 
#                 genome C.  The string '--1' would generate a file in 
#                 which reads uniquely map to genome C. Whether reads 
#                 map to genome A or B would be ignored.
#			   
#                 When --filter is used in conjuction with --tag, FASTQ
#                 files shall be mapped, tagged and then filtered. If
#                 the --tag option is not selected however, the input 
#                 FASTQ file should have been previously tagged.
#	
#  --nohits	  equivalent to --tag --filter 0000 (zero for every genome screened))
