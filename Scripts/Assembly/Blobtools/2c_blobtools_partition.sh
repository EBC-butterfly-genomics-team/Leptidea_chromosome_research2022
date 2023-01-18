#!/bin/bash -l

# Runscript for partition_blobtools_view_table.py

#		GC%	COV
# P14502_103	35.36	99.5657
# P14502_104	35.41	77.3457
# P14502_105	35.40	77.1275
# P14502_106	35.45	63.7896
# P14502_111	35.60	57.4483
# P14502_112	35.68	64.9562
# P14502_115	35.36	86.2653
# P14502_116	35.40	89.2848

# keep all busco scaffolds: CDS_scaffolds - busco = scaffolds to include in cds filtering (a, b)
#		 	    CDS_scaffolds + busco = scaffolds to exclude from non-cds filtering (c, d)
# merge busco scaffolds with filtered scaffolds manually afterwards

module load bioinfo-tools
module load python

SAMPLE=P14502_103
SAMPLE_PATH=/proj/uppoff2020002/private/group_member_backups/LarsH/BLOBTOOLS/RESULTS

GC=35.36
COV=99.5657

python partition_blobtools_view_table.py \
	$SAMPLE_PATH/$SAMPLE.FINAL-deduped-nuc.blobDB.table.txt \
	      -s $SAMPLE-CDS_scaffolds_minus_busco.txt \
	      -gc $GC \
	      -c $COV \
	      -t taxa_to_remove_ac.txt \
	      -o $SAMPLE_PATH/$SAMPLE-cds_a \
        -fcov 10 \
	      -l 500

python partition_blobtools_view_table.py \
        $SAMPLE_PATH/$SAMPLE.FINAL-deduped-nuc.blobDB.table.txt \
        -s $SAMPLE-CDS_scaffolds_minus_busco.txt \
        -gc $GC \
        -c $COV \
        -t taxa_to_remove_bd.txt \
        -o $SAMPLE_PATH/$SAMPLE-cds_b \
        -fxy \
	      -x 20 \
        -y 25 \
        -fgc 25 \
        -fcov 10 \
        -l 500

python partition_blobtools_view_table.py \
        $SAMPLE_PATH/$SAMPLE.FINAL-deduped-nuc.blobDB.table.txt \
        -s $SAMPLE-CDS_scaffolds_plus_busco.txt \
        -e \
	      -gc $GC \
        -c $COV \
        -t taxa_to_remove_ac.txt \
        -o $SAMPLE_PATH/$SAMPLE-non_cds_c \
        -fxy \
	      -x 20 \
        -y 25 \
        -fgc 25 \
        -fcov 10 \
        -l 500

python partition_blobtools_view_table.py \
        $SAMPLE_PATH/$SAMPLE.FINAL-deduped-nuc.blobDB.table.txt \
        -s $SAMPLE-CDS_scaffolds_plus_busco.txt \
        -e \
	      -gc $GC \
        -c $COV \
        -t taxa_to_remove_bd.txt \
        -o $SAMPLE_PATH/$SAMPLE-non_cds_d \
        -fxy \
	      -x 10 \
        -y 50 \
        -fgc 15 \
        -fcov 25 \
        -l 500


# make list of all filtered scaffolds

cd $SAMPLE_PATH
cat busco_scaffolds_$SAMPLE.txt \
	$SAMPLE-cds_a-filtered.txt \
	$SAMPLE-cds_b-filtered.txt \
	$SAMPLE-non_cds_c-filtered.txt \
	$SAMPLE-non_cds_d-filtered.txt |\
	awk '{print $1}' |\
	sort -V > filtered_scaffolds_$SAMPLE.txt


# Options:
#
# -o/--output <string>          Output file name (default=<infile>-filtered.txt)
# -s/--scaffolds <file>         File with list of scaffolds to include in filtering
# -e/--exclude                  Changes behaviour of --scaffolds from include to exclude
# -t/--taxa <file>              File with list of taxa to remove
# -gc/--gc [FLOAT]              Define assembly mean GC%
# -c/--coverage [FLOAT]         Define assembly mean coverage
# -fxy/--xy_filter              Filter on combination of GC% and coverage
# -x/--xy_gc [FLOAT]            GC% threshold for --xy_filter, remove beyond (+/-) N of mean set with --gc
# -y/--xy_coverage [FLOAT]	Coverage threshold for --xy_filter, remove below N% of mean set with --coverage
# -fgc/--gc_filter [FLOAT]	Filter on GC% only, remove beyond (+/-) N of mean set with --gc
# -fcov/--cov_filter [FLOAT]    Filter on coverage only, remove below % of mean coverage set with --coverage
# -l/--length [INT]		Filter on length in bp
