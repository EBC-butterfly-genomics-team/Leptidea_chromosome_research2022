#!/bin/bash

# the script replaces Unknowns with the highest scoring censor-hit and outputs a new censor_...-families.fa file
# use censor output in text format, can be copy-pasted from the web output into a text file (only hit results, not alignments and sequences)


cd /home/larshook/LarsH/REPEATS



for families in P14502_103 P14502_104 P14502_105 P14502_106 P14502_111 P14502_112 P14502_115 P14502_116 Lsin_DToL;

do
  sedvar=$(grep -v "^s*$\|Name\|Alignments\|Map\|SVG" "$families"-families_censor_result.txt |\
        awk '{print $1, $7, $11}' |\
                sort -V -k1 -r |\
                        awk '!best[$1]++' |\
                                awk '{print $1$2, $1}' |\
                                        sed 's/Unknown//' |\
                                                awk -v OFS="\t" '{printf "s,>"$2","">"$1",;"}')

  sed "$sedvar" "$families"-families.fa > censor_"$families"-families.fa

done
