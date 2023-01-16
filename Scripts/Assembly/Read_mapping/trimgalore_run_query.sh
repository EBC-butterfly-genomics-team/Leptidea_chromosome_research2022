#!/bin/bash -l

#SBATCH -J TrimGalore
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 24:00:00
#SBATCH -A snic2022-5-34

# load modules
module load bioinfo-tools
module load TrimGalore/0.6.1
module load cutadapt/2.3
module load FastQC/0.11.8
#module load MultiQC/1.9

READ1=${1:?msg}                              #read name of files containing paired reads
READ2=${2:?msg}  
SRCDIR=${3:?msg}                             #location output folder                        

#cd $SNIC_TMP                                # use local scratch disk

# USAGE: trim_galore [options] <filename(s)>

trim_galore \
	--paired \
	--illumina \
	--phred33 \
	--stringency 1 \
	-e 0.1 \
	--nextseq 30 \
	--length 30 \
	--gzip \
	--output_dir $SRCDIR \
	--cores 2 \
	--fastqc \
	$READ1 \
	$READ2

# notes: 
# --quality:    Trim low-quality ends (Phred score < 30) from reads 
# --paired:     paired-end reads
# --illumina:	look for Illumina adapters (valid for both 'TruSeq Index Adapters' and 
#		'TruSeq Universal Adapter')
# --phred33: 	Instructs cutadapt to use ASCII+33 quality scores as Phred scores (Sanger/Illumina 
#		1.9+ encoding) for quality trimming.
# --strigency:	refers to minimum overlap between read and adapter
# -e:	 	is the maximum allowed error rate (no. of errors divided by the length of the matching region)
# --clip_R1: 	remove XX bp from the 5' end of read 1
# --three_prime_clip_R1: if needed remove XX bp from the 3' end of read 1 AFTER adapter/quality
#                        trimming has been performed.
# --trim-n: 	Removes Ns from either side of the read
# --nextseq:    Use instead of --quality for NextSeq/NovaSeq containing poly G ends.
# --length: 	Discard reads that became shorter than 30 bp because of either quality or adapter
#           	trimming. For paired-end files, both reads of a read-pair need to be longer than
#            	30 bp to be printed out to validated paired-end files
# --gzip:	compress the output file with gzip
# --output_dir: all output will be written to this directory 
# --fastqc:	start FastQC after finishing trimming with cutadapt 


# Read modification order (cutadapt)
# The read modifications described above are applied in the following order to each read.
# 1)   Unconditional base removal with --cut
# 2)   Quality trimming (-q)
# 3)   Adapter trimming (-a, -b, -g and uppercase versions)
# 4)   Read shortening (--length)
# 5)   N-end trimming (--trim-n)
# 6)   Length tag modification (--length-tag)
# 7)   Read name suffix removal (--strip-suffix)
# 8)   Addition of prefix and suffix to read name (-x/--prefix and -y/--suffix)
# 9)   Double-encode the sequence (only colorspace)
# 10)  Replace negative quality values with zero (zero capping, only colorspace)
# 11)  Trim primer base (only colorspace)


#multiqc $SRCDIR/                  # creates single report
