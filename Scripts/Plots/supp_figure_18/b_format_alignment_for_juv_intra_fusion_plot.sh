#!/bin/bash

align_path=/home/larshook/LarsH/WHOLE_GENOME_ALIGNMENTS/BREAKPOINT_ANALYSIS


# first generate karyotype for involved chromosomes
# get start positions from karyotype file: awk '{print $1" "$2" "$3}' juv_intra_fusion_karyotype.txt | sed 's/P14502/chr/;s/DToL/chr_DToL/;s/ /_/;s/ /=/'
# get chr sizes from karyotype file: sed 's/P14502_//' juv_intra_fusion_karyotype.txt | awk '{print "size_"$1"_"$2"="($4-$3)+1}'


# Chr start positions #

chr_112_5=26500000
chr_112_42=58465112
chr_112_43=71636958
chr_112_28=83132951
chr_112_38=102060286
chr_111_24=21500000
chr_111_25=45429833
chr_111_41=69225591
chr_111_17=86726604
chr_103_5=6500000
chr_103_13=36208799
chr_103_9=60546314
chr_103_8=87867876
chr_103_28=115639662
chr_DToL_21=11500000
chr_DToL_14=30511732
chr_DToL_16=50366393
chr_DToL_24=70019251
chr_DToL_7=88626033
chr_DToL_23=109804696
chr_105_12=16500000
chr_105_14=34346550
chr_105_10=52006285
chr_105_19=70048007
chr_105_17=87251918
chr_105_20=104669448
chr_115_4=4000000
chr_115_26=35798425
chr_115_5=44197859
chr_115_6=74339822
chr_115_8=104041558

# Chr lengths #

size_112_5=21965113
size_112_28=8927336
size_112_38=5208144
size_112_42=3171847
size_112_43=1495994
size_111_24=11429834
size_111_25=11295759
size_111_17=14471552
size_111_41=5001014
size_103_5=27208800
size_103_13=21837516
size_103_8=25271787
size_103_28=11658328
size_103_9=24821563
size_DToL_21=14011733
size_DToL_14=14854662
size_DToL_24=13606783
size_DToL_23=13660087
size_DToL_16=14652859
size_DToL_7=16178664
size_105_12=12846551
size_105_14=12659736
size_105_19=12203912
size_105_20=11863124
size_105_10=13041723
size_105_17=12417531
size_115_4=29298426
size_115_26=5899435
size_115_5=27641964
size_115_6=27201737
size_115_8=25372331




##### 112-111 #####

printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_5_24.coords.txt

awk '$8=="HiC_scaffold_5" && $9=="HiC_scaffold_24" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_112_CHR-P14502_111_CHR-filtered_1.delta.coords |\
	awk -v size_112_5="$size_112_5" '{print size_112_5-$1, size_112_5-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_112_5" \
        -v pos_que="$chr_111_24" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_112", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_5_24.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_5_25.coords.txt

awk '$8=="HiC_scaffold_5" && $9=="HiC_scaffold_25" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_112_CHR-P14502_111_CHR-filtered_1.delta.coords |\
	awk -v size_112_5="$size_112_5" '{print size_112_5-$1, size_112_5-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_112_5" \
        -v pos_que="$chr_111_25" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_112", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_5_25.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_42_41.coords.txt

awk '$8=="HiC_scaffold_42" && $9=="HiC_scaffold_41" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_112_CHR-P14502_111_CHR-filtered_1.delta.coords |\
	awk -v size_111_41="$size_111_41" '{print $1, $2, size_111_41-$3, size_111_41-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_112_42" \
        -v pos_que="$chr_111_41" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_112", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_42_41.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_43_41.coords.txt

awk '$8=="HiC_scaffold_43" && $9=="HiC_scaffold_41" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_112_CHR-P14502_111_CHR-filtered_1.delta.coords |\
	awk -v size_112_43="$size_112_43" -v size_111_41="$size_111_41" '{print size_112_43-$1, size_112_43-$2, size_111_41-$3, size_111_41-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_112_43" \
        -v pos_que="$chr_111_41" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_112", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_43_41.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_28_17.coords.txt

awk '$8=="HiC_scaffold_28" && $9=="HiC_scaffold_17" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_112_CHR-P14502_111_CHR-filtered_1.delta.coords |\
	awk -v size_112_28="$size_112_28" -v size_111_17="$size_111_17" '{print size_112_28-$1, size_112_28-$2, size_111_17-$3, size_111_17-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_112_28" \
        -v pos_que="$chr_111_17" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_112", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_28_17.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_38_17.coords.txt

awk '$8=="HiC_scaffold_38" && $9=="HiC_scaffold_17" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_112_CHR-P14502_111_CHR-filtered_1.delta.coords |\
	awk -v size_112_38="$size_112_38" -v size_111_17="$size_111_17" '{print size_112_38-$1, size_112_38-$2, size_111_17-$3, size_111_17-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_112_38" \
        -v pos_que="$chr_111_17" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_112", $8, "P14502_111", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_38_17.coords.txt


##### 111-103 #####

printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_17_3.coords.txt

awk '$8=="HiC_scaffold_17" && $9=="HiC_scaffold_3" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_111_CHR-P14502_103_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_111_17" \
        -v pos_que="$chr_103_3" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_111", $8, "P14502_103", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_17_3.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_17_8.coords.txt

awk '$8=="HiC_scaffold_17" && $9=="HiC_scaffold_8" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_111_CHR-P14502_103_CHR-filtered_1.delta.coords |\
	awk -v size_111_17="$size_111_17" -v size_103_8="$size_103_8" '{print size_111_17-$1, size_111_17-$2, size_103_8-$3, size_103_8-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_111_17" \
        -v pos_que="$chr_103_8" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_111", $8, "P14502_103", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_17_8.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_17_20.coords.txt

awk '$8=="HiC_scaffold_17" && $9=="HiC_scaffold_20" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_111_CHR-P14502_103_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_111_17" \
        -v pos_que="$chr_103_20" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_111", $8, "P14502_103", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_17_20.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_17_28.coords.txt

awk '$8=="HiC_scaffold_17" && $9=="HiC_scaffold_28" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_111_CHR-P14502_103_CHR-filtered_1.delta.coords |\
	awk -v size_111_17="$size_111_17" -v size_103_28="$size_103_28" '{print size_111_17-$1, size_111_17-$2, size_103_28-$3, size_103_28-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_111_17" \
        -v pos_que="$chr_103_28" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_111", $8, "P14502_103", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_17_28.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_41_8.coords.txt

awk '$8=="HiC_scaffold_41" && $9=="HiC_scaffold_8" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_111_CHR-P14502_103_CHR-filtered_1.delta.coords |\
	awk -v size_111_41="$size_111_41" -v size_103_8="$size_103_8" '{print size_111_41-$1, size_111_41-$2, size_103_8-$3, size_103_8-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_111_41" \
        -v pos_que="$chr_103_8" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_111", $8, "P14502_103", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_41_8.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_41_9.coords.txt

awk '$8=="HiC_scaffold_41" && $9=="HiC_scaffold_9" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_111_CHR-P14502_103_CHR-filtered_1.delta.coords |\
	awk -v size_111_41="$size_111_41" '{print size_111_41-$1, size_111_41-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_111_41" \
        -v pos_que="$chr_103_9" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_111", $8, "P14502_103", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_41_9.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_24_2.coords.txt

awk '$8=="HiC_scaffold_24" && $9=="HiC_scaffold_2" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_111_CHR-P14502_103_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_111_24" \
        -v pos_que="$chr_103_2" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_111", $8, "P14502_103", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_24_2.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_24_5.coords.txt

awk '$8=="HiC_scaffold_24" && $9=="HiC_scaffold_5" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_111_CHR-P14502_103_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_111_24" \
        -v pos_que="$chr_103_5" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_111", $8, "P14502_103", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_24_5.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_25_13.coords.txt

awk '$8=="HiC_scaffold_25" && $9=="HiC_scaffold_13" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_111_CHR-P14502_103_CHR-filtered_1.delta.coords |\
        awk -v size_103_13="$size_103_13" '{print $1, $2, size_103_13-$3, size_103_13-$4, $5, $6, $7, $8, $9'} |\
	sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_111_25" \
        -v pos_que="$chr_103_13" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_111", $8, "P14502_103", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_25_13.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_25_22.coords.txt

awk '$8=="HiC_scaffold_25" && $9=="HiC_scaffold_22" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_111_CHR-P14502_103_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_111_25" \
        -v pos_que="$chr_103_22" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_111", $8, "P14502_103", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_25_22.coords.txt



##### 103-DToL #####

printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_103_CHR-Lsin_DToL-filtered_1.CHR_3_43.coords.txt

awk '$8=="HiC_scaffold_3" && $9=="Chr_43" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_103_CHR-Lsin_DToL-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_103_3" \
        -v pos_que="$chr_DToL_43" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_103", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_103_CHR-Lsin_DToL-filtered_1.CHR_3_43.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_103_CHR-Lsin_DToL-filtered_1.CHR_8_24.coords.txt

awk '$8=="HiC_scaffold_8" && $9=="Chr_24" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_103_CHR-Lsin_DToL-filtered_1.delta.coords |\
	awk -v size_103_8="$size_103_8" '{print size_103_8-$1, size_103_8-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_103_8" \
        -v pos_que="$chr_DToL_24" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_103", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_103_CHR-Lsin_DToL-filtered_1.CHR_8_24.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_103_CHR-Lsin_DToL-filtered_1.CHR_20_41.coords.txt

awk '$8=="HiC_scaffold_20" && $9=="Chr_41" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_103_CHR-Lsin_DToL-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_103_20" \
        -v pos_que="$chr_DToL_41" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_103", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_103_CHR-Lsin_DToL-filtered_1.CHR_20_41.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_103_CHR-Lsin_DToL-filtered_1.CHR_28_23.coords.txt

awk '$8=="HiC_scaffold_28" && $9=="Chr_23" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_103_CHR-Lsin_DToL-filtered_1.delta.coords |\
	awk -v size_103_28="$size_103_28" -v size_DToL_23="$size_DToL_23" '{print size_103_28-$1, size_103_28-$2, size_DToL_23-$3, size_DToL_23-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_103_28" \
        -v pos_que="$chr_DToL_23" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_103", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_103_CHR-Lsin_DToL-filtered_1.CHR_28_23.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_103_CHR-Lsin_DToL-filtered_1.CHR_8_7.coords.txt

awk '$8=="HiC_scaffold_8" && $9=="Chr_7" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_103_CHR-Lsin_DToL-filtered_1.delta.coords |\
        awk -v size_103_8="$size_103_8" '{print size_103_8-$1, size_103_8-$2, $3, $4, $5, $6, $7, $8, $9'} |\
	sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_103_8" \
        -v pos_que="$chr_DToL_7" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_103", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_103_CHR-Lsin_DToL-filtered_1.CHR_8_7.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_103_CHR-Lsin_DToL-filtered_1.CHR_9_16.coords.txt

awk '$8=="HiC_scaffold_9" && $9=="Chr_16" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_103_CHR-Lsin_DToL-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_103_9" \
        -v pos_que="$chr_DToL_16" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_103", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_103_CHR-Lsin_DToL-filtered_1.CHR_9_16.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_103_CHR-Lsin_DToL-filtered_1.CHR_2_1.coords.txt

awk '$8=="HiC_scaffold_2" && $9=="Chr_1" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_103_CHR-Lsin_DToL-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_103_2" \
        -v pos_que="$chr_DToL_1" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_103", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_103_CHR-Lsin_DToL-filtered_1.CHR_2_1.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_103_CHR-Lsin_DToL-filtered_1.CHR_5_21.coords.txt

awk '$8=="HiC_scaffold_5" && $9=="Chr_21" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_103_CHR-Lsin_DToL-filtered_1.delta.coords |\
	awk -v size_DToL_21="$size_DToL_21" '{print $1, $2, size_DToL_21-$3, size_DToL_21-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_103_5" \
        -v pos_que="$chr_DToL_21" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_103", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_103_CHR-Lsin_DToL-filtered_1.CHR_5_21.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_103_CHR-Lsin_DToL-filtered_1.CHR_13_14.coords.txt

awk '$8=="HiC_scaffold_13" && $9=="Chr_14" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_103_CHR-Lsin_DToL-filtered_1.delta.coords |\
	awk -v size_103_13="$size_103_13" -v size_DToL_14="$size_DToL_14" '{print size_103_13-$1, size_103_13-$2, size_DToL_14-$3, size_DToL_14-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_103_13" \
        -v pos_que="$chr_DToL_14" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_103", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_103_CHR-Lsin_DToL-filtered_1.CHR_13_14.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_103_CHR-Lsin_DToL-filtered_1.CHR_22_44.coords.txt

awk '$8=="HiC_scaffold_22" && $9=="Chr_44" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_103_CHR-Lsin_DToL-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_103_22" \
        -v pos_que="$chr_DToL_44" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_103", $8, "DToL", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_103_CHR-Lsin_DToL-filtered_1.CHR_22_44.coords.txt



##### DToL-105 #####


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_24_19.coords.txt

awk '$8=="Chr_24" && $9=="HiC_scaffold_19" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_24" \
        -v pos_que="$chr_105_19" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_24_19.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_23_20.coords.txt

awk '$8=="Chr_23" && $9=="HiC_scaffold_20" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
	awk -v size_DToL_23="$size_DToL_23" '{print size_DToL_23-$1, size_DToL_23-$2, $3, $4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_23" \
        -v pos_que="$chr_105_20" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_23_20.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_41_36.coords.txt

awk '$8=="Chr_41" && $9=="HiC_scaffold_36" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_41" \
        -v pos_que="$chr_105_36" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_41_36.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_43_37.coords.txt

awk '$8=="Chr_43" && $9=="HiC_scaffold_37" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_43" \
        -v pos_que="$chr_105_37" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_43_37.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_16_10.coords.txt

awk '$8=="Chr_16" && $9=="HiC_scaffold_10" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_16" \
        -v pos_que="$chr_105_10" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_16_10.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_7_17.coords.txt

awk '$8=="Chr_7" && $9=="HiC_scaffold_17" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_7" \
        -v pos_que="$chr_105_17" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_7_17.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_1_2.coords.txt

awk '$8=="Chr_1" && $9=="HiC_scaffold_2" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_1" \
        -v pos_que="$chr_105_2" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_1_2.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_21_12.coords.txt

awk '$8=="Chr_21" && $9=="HiC_scaffold_12" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
	awk -v size_DToL_21="$size_DToL_21" -v size_105_12="$size_105_12" '{print size_DToL_21-$1, size_DToL_21-$2, size_105_12-$3, size_105_12-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_21" \
        -v pos_que="$chr_105_12" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_21_12.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_14_14.coords.txt

awk '$8=="Chr_14" && $9=="HiC_scaffold_14" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
        awk -v size_DToL_14="$size_DToL_14" '{print size_DToL_14-$1, size_DToL_14-$2, $3, $4, $5, $6, $7, $8, $9'} |\
	sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_14" \
        -v pos_que="$chr_105_14" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_14_14.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > Lsin_DToL-P14502_105_CHR-filtered_1.CHR_44_49.coords.txt

awk '$8=="Chr_44" && $9=="HiC_scaffold_49" && $5>10000 && $6>10000 {print $0}' $align_path/Lsin_DToL-P14502_105_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/Chr_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_DToL_44" \
        -v pos_que="$chr_105_49" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "DToL", $8, "P14502_105", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> Lsin_DToL-P14502_105_CHR-filtered_1.CHR_44_49.coords.txt



##### 105-115 #####


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_19_6.coords.txt

awk '$8=="HiC_scaffold_19" && $9=="HiC_scaffold_6" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_19" \
        -v pos_que="$chr_115_6" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_19_6.coords.txt


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


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_36_22.coords.txt

awk '$8=="HiC_scaffold_36" && $9=="HiC_scaffold_22" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_36" \
        -v pos_que="$chr_115_22" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_36_22.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_37_3.coords.txt

awk '$8=="HiC_scaffold_37" && $9=="HiC_scaffold_3" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_37" \
        -v pos_que="$chr_115_3" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_37_3.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_10_5.coords.txt

awk '$8=="HiC_scaffold_10" && $9=="HiC_scaffold_5" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
	awk -v size_115_5="$size_115_5" '{print $1, $2, size_115_5-$3, size_115_5-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_10" \
        -v pos_que="$chr_115_5" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_10_5.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_17_8.coords.txt

awk '$8=="HiC_scaffold_17" && $9=="HiC_scaffold_8" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_17" \
        -v pos_que="$chr_115_8" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_17_8.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_2_1.coords.txt

awk '$8=="HiC_scaffold_2" && $9=="HiC_scaffold_1" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_2" \
        -v pos_que="$chr_115_1" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_2_1.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_12_4.coords.txt

awk '$8=="HiC_scaffold_12" && $9=="HiC_scaffold_4" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
	awk -v size_105_12="$size_105_12" '{print size_105_12-$1, size_105_12-$2, $3,$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_12" \
        -v pos_que="$chr_115_4" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_12_4.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_14_26.coords.txt

awk '$8=="HiC_scaffold_14" && $9=="HiC_scaffold_26" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
	awk -v size_115_26="$size_115_26" '{print $1, $2, size_115_26-$3, size_115_26-$4, $5, $6, $7, $8, $9'} |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_14" \
        -v pos_que="$chr_115_26" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_14_26.coords.txt


printf  "start_ref\tend_ref\tstart_que\tend_que\tref_assembly\tref_chr\tque_assembly\tque_chr\tref_midpoint\tque_midpoint\n" > P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_49_20.coords.txt

awk '$8=="HiC_scaffold_49" && $9=="HiC_scaffold_20" && $5>10000 && $6>10000 {print $0}' $align_path/P14502_105_CHR-P14502_115_CHR-filtered_1.delta.coords |\
        sed 's/HiC_scaffold_//;s/HiC_scaffold_//' - |\
        awk -v OFS="\t" \
        -v pos_ref="$chr_105_49" \
        -v pos_que="$chr_115_20" \
        '{print $1+pos_ref, $2+pos_ref, \
                $3+pos_que, $4+pos_que, \
        "P14502_105", $8, "P14502_115", $9, \
        ($1+pos_ref+$2+pos_ref)/2, \
        ($3+pos_que+$4+pos_que)/2}' \
        >> P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_49_20.coords.txt



