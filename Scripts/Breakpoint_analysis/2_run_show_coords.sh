#!/bin/bash

module load bioinfo-tools
module load MUMmer

cd /home/larshook/LarsH/WHOLE_GENOME_ALIGNMENTS/BREAKPOINT_ANALYSIS

for file in *filtered_1.delta
do
  show-coords -rTH -I 90 "$file" > "$file".coords
done
