#!/bin/bash

module load bioinfo-tools
module load MUMmer

cd /home/larshook/LarsH/WHOLE_GENOME_ALIGNMENTS/BREAKPOINT_ANALYSIS

for file in *filtered_1.delta
do
  show-coords -c "$file" | sed 's/HiC_scaffold_//g' > "$file".plot.coords
done
