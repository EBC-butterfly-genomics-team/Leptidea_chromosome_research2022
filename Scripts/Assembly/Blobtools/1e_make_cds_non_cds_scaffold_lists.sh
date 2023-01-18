#!/bin/bash

SAMPLE=P14502_116

# set path to busco output "full_table_"
BUSCO_SCAFFOLDS=/home/larshook/LarsH/HiC_ASSEMBLY_V1.2/DEDUPED/BUSCO/run_"$SAMPLE".FINAL-deduped-nuc/full_table_"$SAMPLE".FINAL-deduped-nuc.tsv

# set path to list with cds containing scaffolds
CDS_SCAFFOLDS=/home/larshook/LarsH/BLOBTOOLS/BLAST/"$SAMPLE".FINAL-deduped-nuc_cds_scaffolds.txt

# make list with all busco containing scaffolds (including complete single, complete duplicate and fragmented) and add cds containing scaffolds
awk 'NR>5 {a[$3]++;} END{for(i in a) print i}' "$BUSCO_SCAFFOLDS" > busco_scaffolds_"$SAMPLE".txt
cat busco_scaffolds_"$SAMPLE".txt "$CDS_SCAFFOLDS" > cds_plus_busco_temp

# make nonredundant scaffold lists with cds+busco and cds-busco
awk '{a[$1]++;} END{for(i in a) print i}' cds_plus_busco_temp | sort -V > "$SAMPLE"-CDS_scaffolds_plus_busco.txt
grep -wvf busco_scaffolds_"$SAMPLE".txt "$CDS_SCAFFOLDS" | sort -V > "$SAMPLE"-CDS_scaffolds_minus_busco.txt

# clean up
mv busco_scaffolds_"$SAMPLE".txt /home/larshook/LarsH/BLOBTOOLS/RESULTS/
rm -f cds_plus_busco_temp
