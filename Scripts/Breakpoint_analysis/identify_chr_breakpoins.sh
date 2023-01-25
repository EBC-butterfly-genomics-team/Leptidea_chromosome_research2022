#!/bin/bash

# takes output of MUMmer show-coords (with settings: show-coords -rTH -I 90) on nucmer alignment and makes two bed files, one with alignment block coordinates and one with breakpoint coordinates
# run: ./identify_chr_breakpoins.sh <filtered_alignment_1.coords>


module load bioinfo-tools
module load BEDTools


# get start of each alignment block: print line if previous had different combination of scaffolds
awk '$8!=prev_ref || $9!=prev_que {print} {prev_ref=$8; prev_que=$9}' "$1" > temporary_blocks_1.temp

# get end of each alignment block: same but from end of table
tac "$1" |\
	 awk '$8!=prev_ref || $9!=prev_que {print} {prev_ref=$8; prev_que=$9}' >> temporary_blocks_1.temp


# restructure rows and remove singleton alignments (blocks that have the same start and end)

sort -V -k8,8 -k1 temporary_blocks_1.temp |\
	 uniq -u |\
		 awk -v OFMT="%.f" '!(NR%2) {print $2, $8, $9, ($3+$4)/2} NR%2 {print $1, $8, $9, ($3+$4)/2}' > temporary_blocks_2.temp


# make block bed, filter blocks smaller than 0.1mb, bookend and merge same ref-que pair blocks that are adjacent after removing singletons and filtering

awk '!(NR%2) {print ref_start, $1, $2, $3, que_start, $4} {ref_start=$1; que_start=$4}' temporary_blocks_2.temp |\
	awk '{if ($2-$1>100000) print}' |\
		awk -v OFS="\t" '{if ($3==prev_ref && $4==prev_que && $5>prev_que_end) print $3, prev_end, $2, $4, $5, $6, "1"; \
			else if ($3==prev_ref && $4==prev_que && $5<prev_que_end) print $3, prev_end, $2, $4, $5, $6, "-1"; \
			else if (($3!=prev_ref || $4!=prev_que) && $5<$6) print $3, $1, $2, $4, $5, $6, "1"; \
			else if (($3!=prev_ref || $4!=prev_que) && $5>$6) print $3, $1, $2, $4, $5, $6, "-1"; \
				{prev_ref=$3; prev_que=$4; prev_end=$2; prev_que_end=$6}}' |\
					bedtools merge -c 4,7,5,6,5,6 -o distinct,sum,min,min,max,max |\
						awk -v OFS="\t" '{if ($5>=0) print $1, $2, $3, $4, ($6<$7?$6:$7), ($8>$9?$8:$9); \
							else print $1, $2, $3, $4, ($8>$9?$8:$9), ($6<$7?$6:$7)}' > "$1".blocks.bed


# make breakpoint bed

awk -v OFS="\t" '{if ($5<$6) print $0, "+"; \
	else print $0, "-"}' "$1".blocks.bed |\
		awk -v OFS="\t" '$1==prev {print $1, prev_end, $2, prev_que, prev_que_coord, prev_ori, "pos1", $4, $5, $7, "pos2"} \
		{prev=$1; prev_end=$3; prev_que=$4; prev_que_coord=$6; prev_ori=$7}' > "$1".breakpoint.bed


rm -f temporary_blocks_*.temp
