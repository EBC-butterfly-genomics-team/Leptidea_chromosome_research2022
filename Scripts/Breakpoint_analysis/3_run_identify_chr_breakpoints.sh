#!/bin/bash

module load bioinfo-tools
module load BEDTools

cd /home/larshook/LarsH/WHOLE_GENOME_ALIGNMENTS/BREAKPOINT_ANALYSIS

for file in *.delta.coords
do
  ./home/larshook/SCRIPTS/ASSEMBLY_MS/BREAKPOINTS/identify_chr_breakpoins.sh "$file"
done
