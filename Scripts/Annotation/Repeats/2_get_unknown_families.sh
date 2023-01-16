#!/bin/bash

# make new fasta file containing only "Unknown" repeats 

module load bioinfo-tools
module load biopython


repeat_path=/home/larshook/LarsH/REPEATS

for families in P14502_103 P14502_104 P14502_105 P14502_106 P14502_111 P14502_112 P14502_115 P14502_116 Lsin_DToL;

do

  fasta="$families"-families.fa

  cd "$repeat_path"
  grep "Unknown" "$families"-families.fa | sed 's/>//' > "$families"-families_unknown.txt

  cd /home/larshook/SCRIPTS/ASSEMBLY_MS
  python pick_scaffolds_from_multifasta.py "$repeat_path"/"$fasta" "$repeat_path"/"$families"-families_unknown.txt "$repeat_path"/"$families"-families_unknown.fa

done
