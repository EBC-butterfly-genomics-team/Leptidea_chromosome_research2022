#!/bin/bash

# change format of maker.gff to format suitable as input for MCScanx
# run ./reformat_gff_for_MCScanx.sh <maker.gff> <sp. abbreviation>
# sp. abbreviation is a two letter short for the species used




scaffold_prefix=HiC_scaffold_

# set number of chromosomes in for loop...

for i in {1..42};
do
 grep -w "HiC_scaffold_"$i"" "$1";
done |\

awk '{if ($3=="gene") print $1, $9, $4, $5}' |\
         sed "s/${chr_prefix}/$2/; s/ID=//;s/;/ /; s/G/T/" |\
         awk -v OFS="\t" '{print $1, $2, $4, $5}' > "$2".gff
