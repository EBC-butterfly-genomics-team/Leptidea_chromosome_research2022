#!/bin/bash

module load bioinfo-tools
module load MUMmer

# take after-before alignment file and create output table used	for assembly correction plots (plot_lm_corrections.R)

# run: ./make_coords_for_correction_plot.sh

align_path=/home/larshook/LarsH/WHOLE_GENOME_ALIGNMENTS/AFTER_BEFORE



### 103 and 105 ###

for i in 103 105
do

  printf "ref_start\tref_end\tque_start\tque_end\tref_len\tque_len\tsim\tref_dir\tque_dir\tref\tque\tcorrection\tmarker_pos\n" > "$align_path"/"$i"_corrections.txt

  show-coords -rTHd "$align_path"/LMC_P14502_"$i"_CHR-P14502_"$i"_CHR-filtered_1.delta |\
        awk -v OFS="\t" '{if ($9=="-1") print $0, "inv", "NA"; else if ($1!=$3 && $2!=$4) print $0, "pos", "NA"; else print $0, "same", "NA"}' |\
                sed 's/HiC_scaffold_//g' >> "$align_path"/"$i"_corrections.txt

awk -v OFS="\t" '(NR>1) {print "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", $1, "NA", "marker", $2}' "$align_path"/lm_scaffold_position_"$i"*txt >> "$align_path"/"$i"_corrections.txt

done



### 104 and 106 ###

for i in 104 106
do

  printf "ref_start\tref_end\tque_start\tque_end\tref_len\tque_len\tsim\tref_dir\tque_dir\tref\tque\tcorrection\n" > "$align_path"/"$i"_corrections.txt

  show-coords -rTHd "$align_path"/LMC_P14502_"$i"_CHR-P14502_"$i"_CHR-filtered_1.delta |\
	awk -v OFS="\t" '{if ($9=="-1") print $0, "inv"; else if ($1!=$3 && $2!=$4) print $0, "pos"; else print $0, "same"}' |\
		sed 's/HiC_scaffold_//g' >> "$align_path"/"$i"_corrections.txt

done



### 111, 112, 115 and 116 ###

for i in 111 112 115 116
do 

  printf "ref_start\tref_end\tque_start\tque_end\tref_len\tque_len\tsim\tref_dir\tque_dir\tref\tque\tcorrection\n" > "$align_path"/"$i"_corrections.txt

  show-coords -rTHd "$align_path"/P14502_"$i"_CHR-P14502_"$i"_CHR_V1.2-filtered_1.delta |\
        awk -v OFS="\t" '{if ($9=="-1") print $0, "inv"; else if ($1!=$3 && $2!=$4) print $0, "pos"; else print $0, "same"}' |\
                sed 's/HiC_scaffold_//g' >> "$align_path"/"$i"_corrections.txt

done
