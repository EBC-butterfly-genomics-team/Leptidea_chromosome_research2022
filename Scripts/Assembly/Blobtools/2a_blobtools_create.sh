#!/bin/bash -l
#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 2:00:00
#SBATCH -J blobtools_create

module load bioinfo-tools
module load blobtools/1.1.1

ASSEMBLY=P14502_103
MAIN_PATH=/proj/uppoff2020002/private/group_member_backups/LarsH/

FASTA=$ASSEMBLY.FINAL-deduped-nuc
BLAST=$ASSEMBLY.FINAL-deduped-nuc.out
BAM=$ASSEMBLY-unique-q30-sorted.deduped

cp $MAIN_PATH/HiC_ASSEMBLY_V1.2/DEDUPED/$FASTA.fasta $SNIC_TMP
cp $MAIN_PATH/BLOBTOOLS/BLAST/$BLAST $SNIC_TMP
cp $MAIN_PATH/BLOBTOOLS/BWA/$BAM.ba* $SNIC_TMP

cd $SNIC_TMP

blobtools create \
        -i $FASTA.fasta \
        -t $BLAST \
        -b $BAM.bam \
        -o $FASTA

cp *.cov *.json $MAIN_PATH/BLOBTOOLS/DB


#    Options:
#        -h --help                       show this
#        -i, --infile FASTA              FASTA file of assembly. Headers are split at whitespaces.
#        -y, --type FASTATYPE            Assembly program used to create FASTA. If specified, coverage will be parsed from FASTA header. (Parsing supported for 'spades', 'v$
#        -t, --hitsfile HITS...          Hits file in format (qseqid\ttaxid\tbitscore)(e.g. BLAST output "--outfmt '6 qseqid staxids bitscore'") Can be specified multiple t$
#        -x, --taxrule <TAXRULE>...	 Taxrule determines how taxonomy of blobs is computed (by default both are calculated)
#                                        "bestsum"	 : sum bitscore across all hits for each taxonomic rank
#                                        "bestsumorder"  : sum bitscore across all hits for each taxonomic rank.
#                                                  - If first <TAX> file supplies hits, bestsum is calculated.
#                                                  - If no hit is found, the next <TAX> file is used.
#        -m, --min_score <FLOAT>         Minimal score necessary to be considered for taxonomy calculaton, otherwise set to 'no-hit' [default: 0.0]
#        -d, --min_diff <FLOAT>          Minimal score difference between highest scoring taxonomies (otherwise "unresolved") [default: 0.0]
#        --tax_collision_random          Random allocation of taxonomy if highest scoring taxonomies have equal scores (otherwise "unresolved") [default: False]
#        --nodes <NODES>                 NCBI nodes.dmp file. Not required if '--db'
#        --names <NAMES>                 NCBI names.dmp file. Not required if '--db'
#        --db <NODESDB>                  NodesDB file (default: $BLOBTOOLS/data/nodesDB.txt).
#        -b, --bam <BAM>...              BAM file(s), can be specified multiple times
#        -s, --sam <SAM>...              SAM file(s), can be specified multiple times
#        -a, --cas <CAS>...              CAS file(s) (requires clc_mapping_info in $PATH), can be specified multiple times
#        -c, --cov <COV>...              COV file(s), can be specified multiple times
#        -o, --out <PREFIX>              BlobDB output prefix
#        --title TITLE                   Title of BlobDB [default: output prefix)
