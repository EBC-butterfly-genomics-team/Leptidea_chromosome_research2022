#!/bin/bash -l

module load bioinfo-tools
module load blobtools/1.1.1

ASSEMBLY=P14502_116
MAIN_PATH=/proj/uppoff2020002/private/group_member_backups/LarsH

blobtools seqfilter \
        -i $MAIN_PATH/HiC_ASSEMBLY_V1.2/DEDUPED/$ASSEMBLY.FINAL-deduped-nuc.fasta \
        -l $MAIN_PATH/BLOBTOOLS/RESULTS/filtered_scaffolds_$ASSEMBLY.txt \
        -o $MAIN_PATH/

#    Options:
#
#        -i, --infile <FASTA>        FASTA file of sequences (Headers are split at whitespaces)
#        -l, --list <LIST>           TXT file containing headers of sequences to keep
#        -o, --out <PREFIX>          Output prefix
#        -v, --invert                Invert filtering (Sequences w/ headers NOT in list)
