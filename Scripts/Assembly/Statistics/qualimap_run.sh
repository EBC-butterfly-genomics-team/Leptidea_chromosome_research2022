#!/bin/bash -l
#SBATCH -J QualiMap
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 20:00:00
#SBATCH -A snic2022-5-34

# load modules
module load bioinfo-tools
module load QualiMap/2.2

#PATH_BAM=/proj/uppoff2020002/private/group_member_backups/LarsH/BLOBTOOLS/BWA
PATH_BAM=/home/larshook/LarsH/READ_MAPPING

BAM=P14502_103-unique-q30-sorted.deduped

unset DISPLAY		#Java virtual machine uses DISPLAY environment variable to detect if the X11 system is available.
                        #Sometimes this variable is set incorrectly by the operating system or some applications.
                        #To make Qualimap work simply unset this variable

qualimap bamqc \
	-bam $PATH_BAM/$BAM.bam \
	-outdir $PATH_BAM/QualiMap_$BAM \
	-c \
	-nt 2 \
	-nw 600 \
	--java-mem-size=12G 
	

#usage: qualimap bamqc -bam <arg> [-c] [-gd <arg>] [-gff <arg>] [-hm <arg>] [-nr
#   <arg>] [-nt <arg>] [-nw <arg>] [-oc <arg>] [-os] [-outdir <arg>]
#   [-outfile <arg>] [-outformat <arg>] [-p <arg>]
#-bam <arg>                           Input mapping file in BAM format
#-c,--paint-chromosome-limits         Paint chromosome limits inside charts
#-gd,--genome-gc-distr <arg>          Species to compare with genome GC
#                                  distribution. Possible values: HUMAN or
#                                  MOUSE.
#-gff,--feature-file <arg>            Feature file with regions of interest in
#                                  GFF/GTF or BED format
#-hm <arg>                            Minimum size for a homopolymer to be
#                                  considered in indel analysis (default is
#                                  3)
#-ip,--collect-overlap-pairs          Activate this option to collect statistics
#                                  of overlapping paired-end reads
#-nr <arg>                            Number of reads analyzed in a chunk
#                                  (default is 1000)
#-nt <arg>                            Number of threads (default is 8)
#-nw <arg>                            Number of windows (default is 400)
#-oc,--output-genome-coverage <arg>   File to save per base non-zero coverage.
#                                  Warning: large files are  expected for large
#                                  genomes
#-os,--outside-stats                  Report information for the regions outside
#                                  those defined by feature-file  (ignored
#                                  when -gff option is not set)
#-outdir <arg>                        Output folder for HTML report and raw
#                                  data.
#-outfile <arg>                       Output file for PDF report (default value
#                                  is report.pdf).
#-outformat <arg>                     Format of the ouput report (PDF or HTML,
#                                  default is HTML).
#-p,--sequencing-protocol <arg>       Sequencing library protocol:
#                                  strand-specific-forward,
#                                  strand-specific-reverse or
#                                  non-strand-specific (default)
#-sd,--skip-duplicated             Activate this option to skip duplicate
#                                  alignments from the analysis. If the
#                                  duplicates are not flagged in BAM file,
#                                  then they will be detected by Qualimap
#                                  and can be selected for skipping.
#-sdmode,--skip-dup-mode <arg>        Specific type of duplicated alignments to
#                                  skip (if this option is activated).
#                                  0 : only flagged duplicates (default)
#                                  1 : only estimated by Qualimap
#                                  2 : both flagged and estimated
