#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 36:00:00
#SBATCH -J mummer

module load bioinfo-tools
module load MUMmer/4.0.0rc1

# align assemblies before vs after correction

for i in 103 104 105 106
do

  REFERENCE=LMC_P14502_"$i"_CHR
  QUERY=P14502_"$i"_CHR

  cp /home/larshook/LarsH/HiC_ASSEMBLY_LM_corrected/FINAL/"$REFERENCE".fasta $SNIC_TMP
  cp /home/larshook/LarsH/HiC_ASSEMBLY_V1.2/"$QUERY".fasta $SNIC_TMP

  cd $SNIC_TMP
	
  nucmer \
        --prefix="$REFERENCE"-"$QUERY" \
        --threads=2 \
        "$REFERENCE".fasta \
        "$QUERY".fasta

  delta-filter \
	-m \
	"$REFERENCE"-"$QUERY".delta > "$REFERENCE"-"$QUERY"-filtered_m.delta

  show-coords \
	-c \
	"$REFERENCE"-"$QUERY"-filtered_m.delta | sed 's/HiC_scaffold_//g' > "$REFERENCE"-"$QUERY"-filtered_m.delta.coords

  cp *.delta *.coords /home/larshook/LarsH/WHOLE_GENOME_ALIGNMENTS/AFTER_BEFORE

done



for i in 111 112 115 116
do

  REFERENCE=P14502_"$i"_CHR
  QUERY=P14502_"$i"_CHR_V1.2

  cp /home/larshook/LarsH/HiC_ASSEMBLY_LM_corrected/FINAL/"$REFERENCE".fasta $SNIC_TMP
  cp /home/larshook/LarsH/HiC_ASSEMBLY_V1.2/"$QUERY".fasta $SNIC_TMP

  cd $SNIC_TMP
	
  nucmer \
	--prefix="$REFERENCE"-"$QUERY" \
	--threads=2 \
	"$REFERENCE".fasta \
	"$QUERY".fasta

  delta-filter \
	-m \
	"$REFERENCE"-"$QUERY".delta > "$REFERENCE"-"$QUERY"-filtered_m.delta

  show-coords \
	-c \
	"$REFERENCE"-"$QUERY"-filtered_m.delta | sed 's/HiC_scaffold_//g' > "$REFERENCE"-"$QUERY"-filtered_m.delta.coords

  cp *.delta *.coords /home/larshook/LarsH/WHOLE_GENOME_ALIGNMENTS/AFTER_BEFORE

done



# nucmer

#     --mum                                Use anchor matches that are unique in both the reference and query (false)
#     --maxmatch                           Use all anchor matches regardless of their uniqueness (false)
# -b, --breaklen=uint32                    Set the distance an alignment extension will attempt to extend poor scoring regions before giving up (200)
# -c, --mincluster=uint32                  Sets the minimum length of a cluster of matches (65)
# -D, --diagdiff=uint32                    Set the maximum diagonal difference between two adjacent anchors in a cluster (5)
# -d, --diagfactor=double                  Set the maximum diagonal difference between two adjacent anchors in a cluster as a differential fraction of the gap length (0.12)
#     --noextend                           Do not perform cluster extension step (false)
# -f, --forward                            Use only the forward strand of the Query sequences (false)
# -g, --maxgap=uint32                      Set the maximum gap between two adjacent matches in a cluster (90)
# -l, --minmatch=uint32                    Set the minimum length of a single exact match (20)
# -L, --minalign=uint32                    Minimum length of an alignment, after clustering and extension (0)
#     --nooptimize                         No alignment score optimization, i.e. if an alignment extension reaches the end of a sequence, it will not backtrack to optimize the alignment score and instead terminate the alignment at the end of the sequence (false)
# -r, --reverse                            Use only the reverse complement of the Query sequences (false)
#     --nosimplify                         Don't simplify alignments by removing shadowed clusters. Use this option when aligning a sequence to itself to look for repeats (false)
# -p, --prefix=PREFIX                      Write output to PREFIX.delta (out)
#     --delta=PATH                         Output delta file to PATH (instead of PREFIX.delta)
#     --sam-short=PATH                     Output SAM file to PATH, short format
#     --sam-long=PATH                      Output SAM file to PATH, long format
#     --save=PREFIX                        Save suffix array to files starting with PREFIX
#     --load=PREFIX                        Load suffix array from file starting with PREFIX
#     --batch=BASES                        Proceed by batch of chunks of BASES from the reference
# -t, --threads=NUM                        Use NUM threads (# of cores)
# -U, --usage                              Usage
# -h, --help                               This message
#     --full-help                          Detailed help
# -V, --version                            Version


# delta-filter

# -1            1-to-1 alignment allowing for rearrangements (intersection of -r and -q alignments)
# -g            1-to-1 global alignment not allowing rearrangements
# -h            Display help information
# -i float      Set the minimum alignment identity [0, 100], default 0
# -l int        Set the minimum alignment length, default 0
# -m            Many-to-many alignment allowing for rearrangements (union of -r and -q alignments)
# -q            Maps each position of each query to its best hit in the reference, allowing for reference overlaps
# -r            Maps each position of each reference to its best hit in the query, allowing for query overlaps
# -u float      Set the minimum alignment uniqueness, i.e. percent of the alignment matching to unique reference AND querysequence [0, 100], default 0
# -o float      Set the maximum alignment overlap for -r and -q options as a percent of the alignment length [0, 100], default 100


# show-coords

# -b 		Brief output that only displays the non-redundant locations of aligning regions
# -B 		Switch output to btab format
# -c 		Include percent coverage columns in the output
# -d 		Include the alignment direction/reading frame in the output (default for promer)
# -g 		Only display alignments included in the Longest Ascending Subset, i.e. the global alignment. Recommened to be used in conjunction with the -r or -q options. Does not support circular sequences
# -h 		Print help information and exit
# -H 		Omit the output header
# -I float 	Set minimum percent identity to display
# -k 		*PROMER ONLY* Knockout (do not display) alignments that overlap another alignment in a better reading frame
# -l 		Include sequence length columns in the output
# -L int 	Set minimum alignment length to display
# -o 		Annotate maximal alignments between two sequences, i.e. overlaps between reference and query sequences
# -q	 	Sort output lines by query
# -r 		Sort output lines by reference
# -T 		Switch output to tab-delimited format
