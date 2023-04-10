#!/bin/bash

align_path=/home/larshook/LarsH/WHOLE_GENOME_ALIGNMENTS/BREAKPOINT_ANALYSIS


# first generate karyotype for involved chromosomes
# get start positions from karyotype file: awk '{print $1" "$2" "$3}' juv_fusion_poly_karyotype.txt | sed 's/P14502/chr/;s/DToL/chr_DToL/;s/ /_/;s/ /=/'
# get chr sizes from karyotype file: sed 's/P14502_//' juv_fusion_poly_karyotype.txt | awk '{print "size_"$1"_"$2"="($4-$3)+1}'


# Chr start positions #

chr_112_40=16500000
chr_112_20=28057642
chr_111_27=17000000
chr_111_37=34661207
chr_103_17=12000000
chr_103_23=34406976
chr_DToL_33=10000000
chr_DToL_8=24221221
chr_DToL_47=42673927
chr_105_32=11500000
chr_105_26=26493086
chr_105_45=42864198
chr_115_19=4000000
chr_115_25=24315497
chr_115_21=40408099


# Chr lengths #

size_112_20=13266465
size_112_40=4557643
size_111_37=6968221
size_111_27=10661208
size_103_23=14824031
size_103_17=19406977
size_DToL_47=8352275
size_DToL_8=15952707
size_DToL_33=11721222
size_105_45=7189001
size_105_26=10371113
size_105_32=8993087
size_115_21=17635197
size_115_19=18315498
size_115_25=14092603



##### 112-111 #####

printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_20_27.coords.txt

awk '$8=="HiC_scaffold_20" && $9=="HiC_scaffold_27" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_112_CHR-P14502_111_CHR-filtered_1.delta.coords |\
#        awk -v size_112_="$size_112_" '{print size_112_-$1, size_112_-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_112_20" \
        -v pos_que="$chr_111_27" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_112", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_20_27.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_20_37.coords.txt

awk '$8=="HiC_scaffold_20" && $9=="HiC_scaffold_37" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_112_CHR-P14502_111_CHR-filtered_1.delta.coords |\
#        awk -v size_112_="$size_112_" '{print size_112_-$1, size_112_-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_112_20" \
        -v pos_que="$chr_111_37" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_112", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_20_37.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_40_27.coords.txt

awk '$8=="HiC_scaffold_40" && $9=="HiC_scaffold_27" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_112_CHR-P14502_111_CHR-filtered_1.delta.coords |\
#        awk -v size_112_="$size_112_" '{print size_112_-$1, size_112_-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_112_40" \
        -v pos_que="$chr_111_27" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_112", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_40_27.coords.txt



##### 111-103 #####


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_27_17.coords.txt

awk '$8=="HiC_scaffold_27" && $9=="HiC_scaffold_17" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_111_CHR-P14502_103_CHR-filtered_1.delta.coords |\
#        awk -v size_111_="$size_103_" '{print size_111_-$1, size_103_-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_111_27" \
        -v pos_que="$chr_103_17" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_111", $8, "P14502_103", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_27_17.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_37_23.coords.txt

awk '$8=="HiC_scaffold_37" && $9=="HiC_scaffold_23" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_111_CHR-P14502_103_CHR-filtered_1.delta.coords |\
#        awk -v size_111_="$size_103_" '{print size_111_-$1, size_103_-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_111_37" \
        -v pos_que="$chr_103_23" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_111", $8, "P14502_103", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_37_23.coords.txt



##### 103-DToL #####


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_103_CHR-Lsin_DToL-filtered_1.CHR_23_47.coords.txt

awk '$8=="HiC_scaffold_23" && $9=="Chr_47" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_103_CHR-Lsin_DToL-filtered_1.delta.coords |\
	awk -v size_DToL_47="$size_DToL_47" '{print $1, $2, size_DToL_47-$3, size_DToL_47-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_103_23" \
        -v pos_que="$chr_DToL_47" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_103", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_103_CHR-Lsin_DToL-filtered_1.CHR_23_47.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_103_CHR-Lsin_DToL-filtered_1.CHR_17_8.coords.txt

awk '$8=="HiC_scaffold_17" && $9=="Chr_8" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_103_CHR-Lsin_DToL-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_103_17" \
        -v pos_que="$chr_DToL_8" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_103", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_103_CHR-Lsin_DToL-filtered_1.CHR_17_8.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_103_CHR-Lsin_DToL-filtered_1.CHR_17_33.coords.txt

awk '$8=="HiC_scaffold_17" && $9=="Chr_33" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_103_CHR-Lsin_DToL-filtered_1.delta.coords |\
	awk -v size_DToL_33="$size_DToL_33" '{print $1, $2, size_DToL_33-$3, size_DToL_33-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_103_17" \
        -v pos_que="$chr_DToL_33" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_103", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_103_CHR-Lsin_DToL-filtered_1.CHR_17_33.coords.txt



##### DToL-105 #####


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_47_45.coords.txt

awk '$8=="Chr_47" && $9=="HiC_scaffold_45" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
	awk -v size_DToL_47="$size_DToL_47" '{print size_DToL_47-$1, size_DToL_47-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_47" \
        -v pos_que="$chr_105_45" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_47_45.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_8_26.coords.txt

awk '$8=="Chr_8" && $9=="HiC_scaffold_26" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
	awk -v size_105_26="$size_105_26" '{print $1, $2, size_105_26-$3, size_105_26-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_8" \
        -v pos_que="$chr_105_26" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_8_26.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_33_32.coords.txt

awk '$8=="Chr_33" && $9=="HiC_scaffold_32" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
        awk -v size_DToL_33="$size_DToL_33" -v size_105_32="$size_105_32"  '{print size_DToL_33-$1, size_DToL_33-$2, size_105_32-$3, size_105_32-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_33" \
        -v pos_que="$chr_105_32" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_33_32.coords.txt



##### 105-115 #####


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_45_21.coords.txt

awk '$8=="HiC_scaffold_45" && $9=="HiC_scaffold_21" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_45" \
        -v pos_que="$chr_115_21" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_45_21.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_26_19.coords.txt

awk '$8=="HiC_scaffold_26" && $9=="HiC_scaffold_19" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
	awk -v size_105_26="$size_105_26" '{print size_105_26-$1, size_105_26-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_26" \
        -v pos_que="$chr_115_19" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_26_19.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_26_25.coords.txt

awk '$8=="HiC_scaffold_26" && $9=="HiC_scaffold_25" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
	awk -v size_105_26="$size_105_26" -v size_115_25="$size_115_25" '{print size_105_26-$1, size_105_26-$2, size_115_25-$3, size_115_25-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_26" \
        -v pos_que="$chr_115_25" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_26_25.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_32_19.coords.txt

awk '$8=="HiC_scaffold_32" && $9=="HiC_scaffold_19" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
	awk -v size_105_32="$size_105_32" -v size_115_19="$size_115_19" '{print size_105_32-$1, size_105_32-$2, size_115_19-$3, size_115_19-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_32" \
        -v pos_que="$chr_115_19" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_32_19.coords.txt

