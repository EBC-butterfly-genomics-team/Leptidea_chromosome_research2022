#!/bin/bash

# Make circos links file from the output of MCScanX (collinearity file) and the gff/bed used as input for MCScanX.
# For the reference, the start coordinates of the first gene and the end of the last gene in each block becomes the block/link boundaries.
# This requires a gff/bed based on annotation where the first coordinate is always lower than the second (the orientation would be given by +/-, but not required here).
# For the query, the boundaries of the blocks/links are determined based on the orientation of blocks and genes so that the outermost part (start or end) of the outermost genes are used as boundaries.
# This means that the gff/bed for the query can be based on an alignment where orientation is given by the coordinates (and not specified by +/-).

# run: ./make_circos_links_from_mcscanx_collinearity.sh <file.collinearity> <gene_coordinates.bed>

sed 's/-/ /' "$1" |\
        awk 'NR>11 {print $3, $4}' |\
                grep -C 1 "score" |\
                        grep -v "score\|--" |\
                                awk '{print $1"\n"$2}' \
                                        > blocklist.tmp

awk 'END {print $3"\n"$4}' $1 >> blocklist.tmp

while read line
do
  grep "$line" "$2"
done <blocklist.tmp |\
        paste -d " " - - - - |\

awk '{if ($7<$15) \
                {if ($7<$8 && $15<$16) \
                        print $1, $3, $12, $5, $7, $16; \
                else if ($7>$8 && $15<$16) \
                        print $1, $3, $12, $5, $8, $16; \
                else if ($7<$8 && $15>$16) \
                        print $1, $3, $12, $5, $7, $15; \
                else if ($7>$8 && $15>$16) \
                        print $1, $3, $12, $5, $8, $15}
        else if ($7>$15) \
                {if ($7>$8 && $15>$16) \
                        print $1, $3, $12, $5, $7, $16; \
                else if ($7<$8 && $15>$16) \
                        print $1, $3, $12, $5, $8, $16; \
                else if ($7>$8 && $15<$16) \
                        print $1, $3, $12, $5, $7, $15; \
                else if ($7<$8 && $15<$16) \
                        print $1, $3, $12, $5, $8, $15}
        }' \
> "$1".links

rm -f blocklist.tmp
