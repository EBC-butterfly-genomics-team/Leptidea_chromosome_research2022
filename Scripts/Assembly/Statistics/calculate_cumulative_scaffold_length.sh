#!/bin/bash

module load bioinfo-tools
module load seqtk


# makes a table of cumulative scaffold lengths to plot with script 'cumulative_scaffold_plot.R'


assembly_path=/home/larshook/LarsH/HiC_ASSEMBLY_LM_corrected/FINAL

echo "scaffold sum species sex" > all.cumulative_sum.txt
seqtk comp "$assembly_path"/LMC_P14502_103.FINAL-deduped-nuc.fasta | sort -Vr -k2,2 | awk '{sum+=$2; print NR, sum, "Swe", "Male"}' >> all.cumulative_sum.txt
seqtk comp "$assembly_path"/LMC_P14502_104.FINAL-deduped-nuc.fasta | sort -Vr -k2,2 | awk '{sum+=$2; print NR, sum, "Swe", "Female"}' >> all.cumulative_sum.txt
seqtk comp "$assembly_path"/LMC_P14502_105.FINAL-deduped-nuc.fasta | sort -Vr -k2,2 | awk '{sum+=$2; print NR, sum, "Cat", "Male"}' >> all.cumulative_sum.txt
seqtk comp "$assembly_path"/LMC_P14502_106.FINAL-deduped-nuc.fasta | sort -Vr -k2,2 | awk '{sum+=$2; print NR, sum, "Cat", "Female"}' >> all.cumulative_sum.txt
seqtk comp "$assembly_path"/P14502_111.FINAL-deduped-nuc.fasta | sort -Vr -k2,2 | awk '{sum+=$2; print NR, sum, "Juv", "Male"}' >> all.cumulative_sum.txt
seqtk comp "$assembly_path"/P14502_112.FINAL-deduped-nuc.fasta | sort -Vr -k2,2 | awk '{sum+=$2; print NR, sum, "Juv", "Female"}' >> all.cumulative_sum.txt
seqtk comp "$assembly_path"/P14502_115.FINAL-deduped-nuc.fasta | sort -Vr -k2,2 | awk '{sum+=$2; print NR, sum, "Rea", "Male"}' >> all.cumulative_sum.txt
seqtk comp "$assembly_path"/P14502_116.FINAL-deduped-nuc.fasta | sort -Vr -k2,2 | awk '{sum+=$2; print NR, sum, "Rea", "Female"}' >> all.cumulative_sum.txt

mv all.cumulative_sum.txt /home/larshook/SCRIPTS/ASSEMBLY_MS/PLOTS
