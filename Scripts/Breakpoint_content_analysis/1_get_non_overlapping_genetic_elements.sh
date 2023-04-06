#!/bin/bash

module load bioinfo-tools
module load BEDTools

genome=Lsin_DToL
repeat_out=/home/larshook/LarsH/REPEATS/MASKED/Lsin_DToL/Lsin_DToL.fasta.out
cds=/home/larshook/LarsH/MAKER/SIN_DToL/Lsin_DToL.all.maker.domain.gff

# parse RepeatMasker output

sed 's/Simple_repeat/SR/;s/Simple/SR/;s/IntegratedVirus/ERV/;s/NonLTR\/Penelope.*/PLE/;s/NonLTR.*/LINE/;s/Unknown/UC/;s/?//;s/\// /' "$repeat_out" |\
	awk -v OFS="\t" 'NR>3 {print $5, $6, $7, $11}' > "$genome"_all_repeats.bed

# split elements into categories and merge overlaps

echo "chr	start	end	type" > "$genome"_non_overlapping_elements.bed

for type in DNA LINE SINE RC LTR;
do
grep -w "$type" "$genome"_all_repeats.bed |\
	sort -V |\
		bedtools merge -i - -c 4 -o distinct >> "$genome"_non_overlapping_elements.bed
done

awk -v OFS="\t" '{if ($3=="CDS") print $1, $4, $5, "CDS"}' "$cds" | sort -V | bedtools merge -i - -c 4 -o distinct >> "$genome"_non_overlapping_elements.bed
