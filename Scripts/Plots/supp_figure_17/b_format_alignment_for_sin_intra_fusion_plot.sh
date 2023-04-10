#!/bin/bash

align_path=/home/larshook/LarsH/WHOLE_GENOME_ALIGNMENTS/BREAKPOINT_ANALYSIS

# get start positions from karyotype file: awk '{print $1" "$2" "$3}' sin_intra_fusion_karyotype.txt | sed 's/P14502/chr/;s/DToL/chr_DToL/;s/ /_/;s/ /=/'

# Chr start positions #

chr_103_19=20000000
chr_103_25=66601477
chr_103_21=110072918
chr_103_28=156316964
chr_104_3=34000000
chr_104_6=124766623
chr_DToL_39=17000000
chr_DToL_38=46639948
chr_DToL_12=76374744
chr_DToL_4=111739155
chr_DToL_23=148936197
chr_105_34=14000000
chr_105_38=39852937
chr_105_48=64925304
chr_105_52=88703018
chr_105_35=111811367
chr_105_44=137321858
chr_105_20=161784507
chr_115_10=10000000
chr_115_15=47789909
chr_115_21=80452804
chr_115_6=111088000
chr_115_5=151289736
chr_111_28=4000000
chr_111_2=16343000
chr_111_15=49679291
chr_111_13=67381425
chr_111_8=87197938
chr_111_22=108954206
chr_111_26=122615221
chr_111_21=135785888
chr_111_17=149946482
chr_111_14=166418033


# Chr lengths #

size_103_19=16601477
size_103_21=16244046
size_103_25=13471441
size_103_28=11658327
size_104_3=30766623
size_104_6=27668879
size_DToL_4=17197042
size_DToL_12=15364411
size_DToL_23=13660086
size_DToL_38=9734796
size_DToL_39=9639948
size_105_20=11863123
size_105_34=8852937
size_105_35=8510491
size_105_38=8072367
size_105_44=7462649
size_105_48=6777714
size_105_52=6108349
size_115_5=27641963
size_115_6=27201736
size_115_10=24789909
size_115_15=19662895
size_115_21=17635196
size_111_2=31336291
size_111_8=19756268
size_111_13=17816513
size_111_14=16165119
size_111_15=15702134
size_111_17=14471551
size_111_21=12160594
size_111_22=11661015
size_111_26=11170667
size_111_28=10343000



##### 103-104 #####

printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_19_3.coords.txt

awk '$8=="HiC_scaffold_19" && $9=="HiC_scaffold_3" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_103_CHR-P14502_104_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_103_19" \
        -v pos_que="$chr_104_3" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_103", $8, "P14502_104", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_19_3.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_25_3.coords.txt

awk '$8=="HiC_scaffold_25" && $9=="HiC_scaffold_3" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_103_CHR-P14502_104_CHR-filtered_1.delta.coords |\
	awk -v size_103_25="$size_103_25" '{print size_103_25-$1, size_103_25-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_103_25" \
        -v pos_que="$chr_104_3" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_103", $8, "P14502_104", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_25_3.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_21_6.coords.txt

awk '$8=="HiC_scaffold_21" && $9=="HiC_scaffold_6" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_103_CHR-P14502_104_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_103_21" \
        -v pos_que="$chr_104_6" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_103", $8, "P14502_104", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_21_6.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_28_6.coords.txt

awk '$8=="HiC_scaffold_28" && $9=="HiC_scaffold_6" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_103_CHR-P14502_104_CHR-filtered_1.delta.coords |\
	awk -v size_103_28="$size_103_28" '{print size_103_28-$1, size_103_28-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_103_28" \
        -v pos_que="$chr_104_6" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_103", $8, "P14502_104", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_28_6.coords.txt


##### 104-DToL #####

printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_104_CHR-Lsin_DToL-filtered_1.CHR_3_38.coords.txt

awk '$8=="HiC_scaffold_3" && $9=="Chr_38" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_104_CHR-Lsin_DToL-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_104_3" \
        -v pos_que="$chr_DToL_38" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_104", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_104_CHR-Lsin_DToL-filtered_1.CHR_3_38.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_104_CHR-Lsin_DToL-filtered_1.CHR_3_39.coords.txt

awk '$8=="HiC_scaffold_3" && $9=="Chr_39" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_104_CHR-Lsin_DToL-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_104_3" \
        -v pos_que="$chr_DToL_39" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_104", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_104_CHR-Lsin_DToL-filtered_1.CHR_3_39.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_104_CHR-Lsin_DToL-filtered_1.CHR_3_12.coords.txt

awk '$8=="HiC_scaffold_3" && $9=="Chr_12" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_104_CHR-Lsin_DToL-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_104_3" \
        -v pos_que="$chr_DToL_12" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_104", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_104_CHR-Lsin_DToL-filtered_1.CHR_3_12.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_104_CHR-Lsin_DToL-filtered_1.CHR_6_4.coords.txt

awk '$8=="HiC_scaffold_6" && $9=="Chr_4" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_104_CHR-Lsin_DToL-filtered_1.delta.coords |\
	awk -v size_DToL_4="$size_DToL_4" '{print $1, $2, size_DToL_4-$3, size_DToL_4-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_104_6" \
        -v pos_que="$chr_DToL_4" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_104", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_104_CHR-Lsin_DToL-filtered_1.CHR_6_4.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_104_CHR-Lsin_DToL-filtered_1.CHR_6_23.coords.txt

awk '$8=="HiC_scaffold_6" && $9=="Chr_23" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_104_CHR-Lsin_DToL-filtered_1.delta.coords |\
	awk -v size_DToL_23="$size_DToL_23" '{print $1, $2, size_DToL_23-$3, size_DToL_23-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_104_6" \
        -v pos_que="$chr_DToL_23" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_104", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_104_CHR-Lsin_DToL-filtered_1.CHR_6_23.coords.txt


##### DToL-105 #####

printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_38_38.coords.txt

awk '$8=="Chr_38" && $9=="HiC_scaffold_38" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
	awk -v size_105_38="$size_105_38" '{print $1, $2, size_105_38-$3, size_105_38-$4, $5, $6, $7, $8, $9'} |\
        sed 's/Chr_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_38" \
        -v pos_que="$chr_105_38" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_38_38.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_39_34.coords.txt

awk '$8=="Chr_39" && $9=="HiC_scaffold_34" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
        sed 's/Chr_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_39" \
        -v pos_que="$chr_105_34" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_39_34.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_12_48.coords.txt

awk '$8=="Chr_12" && $9=="HiC_scaffold_48" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
	awk -v size_105_48="$size_105_48" '{print $1, $2, size_105_48-$3, size_105_48-$4, $5, $6, $7, $8, $9'} |\
        sed 's/Chr_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_12" \
        -v pos_que="$chr_105_48" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_12_48.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_12_52.coords.txt

awk '$8=="Chr_12" && $9=="HiC_scaffold_52" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
        sed 's/Chr_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_12" \
        -v pos_que="$chr_105_52" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_12_52.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_4_35.coords.txt

awk '$8=="Chr_4" && $9=="HiC_scaffold_35" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
	awk -v size_DToL_4="$size_DToL_4" '{print size_DToL_4-$1, size_DToL_4-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/Chr_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_4" \
        -v pos_que="$chr_105_35" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_4_35.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_4_44.coords.txt

awk '$8=="Chr_4" && $9=="HiC_scaffold_44" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
        awk -v size_DToL_4="$size_DToL_4" '{print size_DToL_4-$1, size_DToL_4-$2, $3, $4, $5, $6, $7, $8, $9'} |\
	sed 's/Chr_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_4" \
        -v pos_que="$chr_105_44" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_4_44.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_23_20.coords.txt

awk '$8=="Chr_23" && $9=="HiC_scaffold_20" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
	awk -v size_DToL_23="$size_DToL_23" '{print size_DToL_23-$1, size_DToL_23-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/Chr_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_23" \
        -v pos_que="$chr_105_20" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_23_20.coords.txt


##### 105-115 #####

printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_34_10.coords.txt

awk '$8=="HiC_scaffold_34" && $9=="HiC_scaffold_10" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
	awk -v size_115_10="$size_115_10" '{print $1, $2, size_115_10-$3, size_115_10-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_34" \
        -v pos_que="$chr_115_10" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_34_10.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_38_10.coords.txt

awk '$8=="HiC_scaffold_38" && $9=="HiC_scaffold_10" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
	awk -v size_105_38="$size_105_38" -v size_115_10="$size_115_10" '{print size_105_38-$1, size_105_38-$2, size_115_10-$3, size_115_10-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_38" \
        -v pos_que="$chr_115_10" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_38_10.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_48_15.coords.txt

awk '$8=="HiC_scaffold_48" && $9=="HiC_scaffold_15" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
	awk -v size_105_48="$size_105_48" '{print size_105_48-$1, size_105_48-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_48" \
        -v pos_que="$chr_115_15" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_48_15.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_48_21.coords.txt

awk '$8=="HiC_scaffold_48" && $9=="HiC_scaffold_21" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
	awk -v size_105_48="$size_105_48" '{print size_105_48-$1, size_105_48-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_48" \
        -v pos_que="$chr_115_21" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_48_21.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_52_21.coords.txt

awk '$8=="HiC_scaffold_52" && $9=="HiC_scaffold_21" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_52" \
        -v pos_que="$chr_115_21" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_52_21.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_35_6.coords.txt

awk '$8=="HiC_scaffold_35" && $9=="HiC_scaffold_6" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
	awk -v size_115_6="$size_115_6" '{print $1, $2, size_115_6-$3, size_115_6-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_35" \
        -v pos_que="$chr_115_6" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_35_6.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_44_6.coords.txt

awk '$8=="HiC_scaffold_44" && $9=="HiC_scaffold_6" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
        awk -v size_115_6="$size_115_6" '{print $1, $2, size_115_6-$3, size_115_6-$4, $5, $6, $7, $8, $9'} |\
	sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_44" \
        -v pos_que="$chr_115_6" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_44_6.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_20_5.coords.txt

awk '$8=="HiC_scaffold_20" && $9=="HiC_scaffold_5" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
	awk -v size_115_5="$size_115_5" '{print $1, $2, size_115_5-$3, size_115_5-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_20" \
        -v pos_que="$chr_115_5" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_20_5.coords.txt



##### 115-111 #####


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_10_2.coords.txt

awk '$8=="HiC_scaffold_10" && $9=="HiC_scaffold_2" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_115_CHR-P14502_111_CHR-filtered_1.delta.coords |\
	awk -v size_115_10="$size_115_10" -v size_111_2="$size_111_2" '{print size_115_10-$1, size_115_10-$2, size_111_2-$3, size_111_2-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_115_10" \
        -v pos_que="$chr_111_2" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_115", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_10_2.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_10_28.coords.txt

awk '$8=="HiC_scaffold_10" && $9=="HiC_scaffold_28" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_115_CHR-P14502_111_CHR-filtered_1.delta.coords |\
	awk -v size_115_10="$size_115_10" '{print size_115_10-$1, size_115_10-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_115_10" \
        -v pos_que="$chr_111_28" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_115", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_10_28.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_15_15.coords.txt

awk '$8=="HiC_scaffold_15" && $9=="HiC_scaffold_15" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_115_CHR-P14502_111_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_115_15" \
        -v pos_que="$chr_111_15" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_115", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_15_15.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_21_13.coords.txt

awk '$8=="HiC_scaffold_21" && $9=="HiC_scaffold_13" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_115_CHR-P14502_111_CHR-filtered_1.delta.coords |\
	awk -v size_111_13="$size_111_13" '{print $1, $2, size_111_13-$3, size_111_13-$4, $5, $6, $7, $8, $9'} |\
	sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_115_21" \
        -v pos_que="$chr_111_13" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_115", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_21_13.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_21_15.coords.txt

awk '$8=="HiC_scaffold_21" && $9=="HiC_scaffold_15" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_115_CHR-P14502_111_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_115_21" \
        -v pos_que="$chr_111_15" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_115", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_21_15.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_6_8.coords.txt

awk '$8=="HiC_scaffold_6" && $9=="HiC_scaffold_8" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_115_CHR-P14502_111_CHR-filtered_1.delta.coords |\
	awk -v size_115_6="$size_115_6" '{print size_115_6-$1, size_115_6-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_115_6" \
        -v pos_que="$chr_111_8" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_115", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_6_8.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_6_13.coords.txt

awk '$8=="HiC_scaffold_6" && $9=="HiC_scaffold_13" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_115_CHR-P14502_111_CHR-filtered_1.delta.coords |\
	awk -v size_115_6="$size_115_6" -v size_111_13="$size_111_13" '{print size_115_6-$1, size_115_6-$2, size_111_13-$3, size_111_13-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_115_6" \
        -v pos_que="$chr_111_13" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_115", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_6_13.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_6_22.coords.txt

awk '$8=="HiC_scaffold_6" && $9=="HiC_scaffold_22" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_115_CHR-P14502_111_CHR-filtered_1.delta.coords |\
	awk -v size_115_6="$size_115_6" -v size_111_22="$size_111_22" '{print size_115_6-$1, size_115_6-$2, size_111_22-$3, size_111_22-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_115_6" \
        -v pos_que="$chr_111_22" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_115", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_6_22.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_6_26.coords.txt

awk '$8=="HiC_scaffold_6" && $9=="HiC_scaffold_26" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_115_CHR-P14502_111_CHR-filtered_1.delta.coords |\
	awk -v size_115_6="$size_115_6" -v size_111_26="$size_111_26" '{print size_115_6-$1, size_115_6-$2, size_111_26-$3, size_111_26-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_115_6" \
        -v pos_que="$chr_111_26" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_115", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_6_26.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_5_14.coords.txt

awk '$8=="HiC_scaffold_5" && $9=="HiC_scaffold_14" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_115_CHR-P14502_111_CHR-filtered_1.delta.coords |\
	awk -v size_115_5="$size_115_5" -v size_111_14="$size_111_14" '{print size_115_5-$1, size_115_5-$2, size_111_14-$3, size_111_14-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_115_5" \
        -v pos_que="$chr_111_14" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_115", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_5_14.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_5_17.coords.txt

awk '$8=="HiC_scaffold_5" && $9=="HiC_scaffold_17" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_115_CHR-P14502_111_CHR-filtered_1.delta.coords |\
	awk -v size_115_5="$size_115_5" -v size_111_17="$size_111_17" '{print size_115_5-$1, size_115_5-$2, size_111_17-$3, size_111_17-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_115_5" \
        -v pos_que="$chr_111_17" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_115", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_5_17.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_5_21.coords.txt

awk '$8=="HiC_scaffold_5" && $9=="HiC_scaffold_21" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_115_CHR-P14502_111_CHR-filtered_1.delta.coords |\
	awk -v size_115_5="$size_115_5" -v size_111_21="$size_111_21" '{print size_115_5-$1, size_115_5-$2, size_111_21-$3, size_111_21-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_115_5" \
        -v pos_que="$chr_111_21" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_115", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_5_21.coords.txt

