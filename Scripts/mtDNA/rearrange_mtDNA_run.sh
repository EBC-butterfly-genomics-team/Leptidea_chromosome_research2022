#!/bin/bash -l

#SBATCH -J rearrange_mtDNA
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 1:00:00
#SBATCH -A snic2022-5-34

module load bioinfo-tools
module load biopython


mtdna_path=/home/larshook/LarsH/MtDNA


cd /home/larshook/SCRIPTS/ASSEMBLY_MS/MtDNA


for i in P14502_103 P14502_104 P14502_105 P14502_106 P14502_111 P14502_112 P14502_115 P14502_116;
do

  rearrange_mtDNA.py mtdna_path/Circularized_assembly_1_"$i".fasta mtdna_path/"$i".bed

done

mv *rearranged.fasta "$mtdna_path"
