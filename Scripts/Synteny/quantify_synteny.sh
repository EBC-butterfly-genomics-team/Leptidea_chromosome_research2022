#!/bin/bash

# Quantify synteny vs B. mori:


#1: Leptidea synteny blocks / chr
#2: B. mori chr / Leptidea chr
#3: Leptidea block sizes
#4: Number of orthologs / block
#5: Number of genes / block


echo "count     type    species" > leptidea_synteny_data.txt


for species in ls lr lc lj;
do

synteny_genes=/home/larshook/LarsH/MCScanX/bm_"$species"/bm_"$species".collinearity
synteny_coords=/home/larshook/SCRIPTS/CIRCOS/bm_"$species"/bm_"$species".collinearity.links


#1
awk -v OFS="\t" -v species="$species" '{a[$1]++;} END{for(i in a) print a[i], "blocks_per_chr", species}' "$synteny_coords" >> leptidea_synteny_data.txt

#2
awk -v OFS="\t" '{a[$4"\t"$1]++;} END{for(i in a) print i}' "$synteny_coords" |\
        awk -v OFS="\t" -v species="$species" '{a[$1]++;} END{for(i in a) print a[i], "chr_in_chr", species}' >> leptidea_synteny_data.txt

#3
awk -v OFS="\t" -v species="$species" '{print $6-$5, "block_sizes", species}' "$synteny_coords" |\
        sed 's/-//' >> leptidea_synteny_data.txt

#4
grep -w "## Alignment" "$synteny_genes" |\
        awk -v OFS="\t" -v species="$species" '{print $6, "orthologs_per_block", species}' |\
                sed 's/N=//' >> leptidea_synteny_data.txt

#5
awk '{print $0} END{print "score"}' "$synteny_genes" |\
        sed 's/-/ /' |\
                grep -C 1 "score" |\
                        grep -v "score\|--" |\
                                awk 'NR>1 {print $4}' |\
                                        paste - - |\
                                                sed 's/[A-Z]//g' |\
                                                        awk '{print $2-$1}' | sed 's/-//' | awk -v OFS="\t" -v species="$species" '{print $1+1, "genes_per_block", species}' >> leptidea_synteny_data.txt

done
