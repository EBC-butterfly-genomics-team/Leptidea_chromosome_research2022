#!/bin/bash

##### Categorize breakpoints as fusion or fission and infer evolutionary event #####

# run ./4_classify_breakpoints.sh <out_file_name>

module load bioinfo-tools
module load BEDTools

swe_m=P14502_103
swe_f=P14502_104
spa_m=P14502_105
spa_f=P14502_106
juv_m=P14502_111
juv_f=P14502_112
rea_m=P14502_115
rea_f=P14502_116



cd /home/larshook/LarsH/WHOLE_GENOME_ALIGNMENTS/BREAKPOINT_ANALYSIS



echo "chr       chr_start       chr_end type    ref" > "$1"


#####################################################
##### coordinates with Swe sinapis as reference #####
#####################################################


##### fu swe #####

bedtools intersect \
	-a "$swe_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
	-b "$swe_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
	   "$swe_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$swe_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
	   "$swe_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$swe_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
		 awk -v OFS="\t" '{if ($6=="5") print $1, $2, $3, "fu_swe", "SWE"}' |\
			bedtools intersect -a - -b "$swe_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
			bedtools intersect -a - -b "$swe_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
			bedtools intersect -a - -b "$swe_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
			bedtools intersect -a - -b "$swe_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
			bedtools intersect -a - -b "$swe_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
			bedtools intersect -a - -b "$swe_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
				sed 's/HiC_scaffold_/chr_/' >> "$1"


##### fu anc sin #####

bedtools intersect \
        -a "$swe_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$swe_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
	   "$swe_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$swe_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                 awk -v OFS="\t" '{if ($6=="3") print $1, $2, $3, "fu_anc_sin", "SWE"}' |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
			bedtools intersect -a - -b "$swe_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
				sed 's/HiC_scaffold_/chr_/' >> "$1"


##### BR/ILS juv/spa #####

bedtools intersect \
        -a "$swe_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$swe_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
           "$swe_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$swe_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                 awk -v OFS="\t" '{if ($6=="3") print $1, $2, $3, "BR/ILS_juv/spa", "SWE"}' |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### BR/ILS rea/spa #####

bedtools intersect \
        -a "$swe_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$swe_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
           "$swe_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$swe_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                 awk -v OFS="\t" '{if ($6=="3") print $1, $2, $3, "BR/ILS_rea/spa", "SWE"}' |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### fi spa  #####

bedtools intersect \
	-a "$swe_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
	-b "$swe_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
		awk -v OFS="\t" '{if ($6=="1") print $1, $2, $3, "fi_spa", "SWE"}' |\
			bedtools intersect -a - -b "$swe_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
			bedtools intersect -a - -b "$swe_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
			bedtools intersect -a - -b "$swe_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
			bedtools intersect -a - -b "$swe_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
			bedtools intersect -a - -b "$swe_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
			bedtools intersect -a - -b "$swe_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
				sed 's/HiC_scaffold_/chr_/' >> "$1"


##### fi rea #####

bedtools intersect \
        -a "$swe_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$swe_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                awk -v OFS="\t" '{if ($6=="1") print $1, $2, $3, "fi_rea", "SWE"}' |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### fi juv / fu anc rea/sin #####

bedtools intersect \
        -a "$swe_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$swe_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                awk -v OFS="\t" '{if ($6=="1") print $1, $2, $3, "fi_juv/fu_anc_rea/sin", "SWE"}' |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$swe_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"



#####################################################
##### coordinates with Spa sinapis as reference #####
#####################################################


##### fu spa #####

bedtools intersect \
        -a "$spa_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$spa_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
           "$spa_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$spa_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
           "$spa_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$spa_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                 awk -v OFS="\t" '{if ($6=="5") print $1, $2, $3, "fu_spa", "SPA"}' |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### fu anc sin #####

bedtools intersect \
        -a "$spa_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$spa_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
           "$spa_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$spa_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                 awk -v OFS="\t" '{if ($6=="3") print $1, $2, $3, "fu_anc_sin", "SPA"}' |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### BR/ILS juv/swe #####

bedtools intersect \
        -a "$spa_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$spa_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
           "$spa_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$spa_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                 awk -v OFS="\t" '{if ($6=="3") print $1, $2, $3, "BR/ILS_juv/swe", "SPA"}' |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### BR/ILS rea/swe #####

bedtools intersect \
        -a "$spa_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$spa_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
           "$spa_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$spa_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                 awk -v OFS="\t" '{if ($6=="3") print $1, $2, $3, "BR/ILS_rea/swe", "SPA"}' |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### fi swe  #####

bedtools intersect \
        -a "$spa_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$spa_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                awk -v OFS="\t" '{if ($6=="1") print $1, $2, $3, "fi_swe", "SPA"}' |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### fi rea #####

bedtools intersect \
        -a "$spa_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$spa_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                awk -v OFS="\t" '{if ($6=="1") print $1, $2, $3, "fi_rea", "SPA"}' |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### fi juv / fu anc rea/sin #####

bedtools intersect \
        -a "$spa_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$spa_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                awk -v OFS="\t" '{if ($6=="1") print $1, $2, $3, "fi_juv/fu_anc_rea/sin", "SPA"}' |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$spa_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"



#############################################
##### coordinates with Rea as reference #####
#############################################


##### fu rea #####

bedtools intersect \
        -a "$rea_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$rea_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
           "$rea_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$rea_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
           "$rea_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$rea_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                 awk -v OFS="\t" '{if ($6=="5") print $1, $2, $3, "fu_rea", "REA"}' |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### fi anc sin #####

bedtools intersect \
        -a "$rea_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$rea_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
           "$rea_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$rea_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                 awk -v OFS="\t" '{if ($6=="3") print $1, $2, $3, "fi_anc_sin", "REA"}' |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### BR/ILS juv/swe #####

bedtools intersect \
        -a "$rea_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$rea_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
           "$rea_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$rea_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                 awk -v OFS="\t" '{if ($6=="3") print $1, $2, $3, "BR/ILS_juv/swe", "REA"}' |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### BR/ILS juv/spa #####

bedtools intersect \
        -a "$rea_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$rea_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
           "$rea_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$rea_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                 awk -v OFS="\t" '{if ($6=="3") print $1, $2, $3, "BR/ILS_juv/spa", "REA"}' |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### fi swe #####

bedtools intersect \
        -a "$rea_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$rea_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                awk -v OFS="\t" '{if ($6=="1") print $1, $2, $3, "fi_swe", "REA"}' |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"

##### fi spa #####

bedtools intersect \
        -a "$rea_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$rea_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                awk -v OFS="\t" '{if ($6=="1") print $1, $2, $3, "fi_spa", "REA"}' |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### fi juv / fu anc rea/sin #####

bedtools intersect \
        -a "$rea_m"_CHR-"$juv_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$rea_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                awk -v OFS="\t" '{if ($6=="1") print $1, $2, $3, "fi_juv/fu_anc_rea/sin", "REA"}' |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$rea_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


#############################################
##### coordinates with Juv as reference #####
#############################################


##### fu juv / fi anc rea/sin #####

bedtools intersect \
        -a "$juv_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$juv_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
           "$juv_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$juv_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
           "$juv_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$juv_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                 awk -v OFS="\t" '{if ($6=="5") print $1, $2, $3, "fu_juv/fi_anc_rea/sin", "JUV"}' |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### fi anc sin #####

bedtools intersect \
        -a "$juv_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$juv_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
           "$juv_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$juv_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                 awk -v OFS="\t" '{if ($6=="3") print $1, $2, $3, "fi_anc_sin", "JUV"}' |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### BR/ILS rea/swe #####

bedtools intersect \
        -a "$juv_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$juv_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
           "$juv_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$juv_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                 awk -v OFS="\t" '{if ($6=="3") print $1, $2, $3, "BR/ILS_rea/swe", "JUV"}' |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### BR/ILS rea/spa #####

bedtools intersect \
        -a "$juv_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$juv_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed \
           "$juv_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed "$juv_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                 awk -v OFS="\t" '{if ($6=="3") print $1, $2, $3, "BR/ILS_rea/spa", "JUV"}' |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### fi swe #####

bedtools intersect \
        -a "$juv_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$juv_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                awk -v OFS="\t" '{if ($6=="1") print $1, $2, $3, "fi_swe", "JUV"}' |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### fi spa #####

bedtools intersect \
        -a "$juv_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$juv_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                awk -v OFS="\t" '{if ($6=="1") print $1, $2, $3, "fi_spa", "JUV"}' |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"


##### fi rea #####

bedtools intersect \
        -a "$juv_m"_CHR-"$rea_m"_CHR-filtered_1.delta.coords.breakpoint.bed \
        -b "$juv_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed -c |\
                awk -v OFS="\t" '{if ($6=="1") print $1, $2, $3, "fi_rea", "JUV"}' |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$rea_f"_CHR-filtered_1.delta.coords.breakpoint.bed |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$swe_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$swe_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$spa_m"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$spa_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                        bedtools intersect -a - -b "$juv_m"_CHR-"$juv_f"_CHR-filtered_1.delta.coords.breakpoint.bed -v |\
                                sed 's/HiC_scaffold_/chr_/' >> "$1"



# make separate bp files for each species

echo "chr	chr_start	chr_end type    ref" > breakpoint_coordinates_swe.txt
grep "SWE" $1 >> breakpoint_coordinates_swe.txt 

echo "chr       chr_start	chr_end type    ref" > breakpoint_coordinates_spa.txt
grep "SPA" $1 >> breakpoint_coordinates_spa.txt

echo "chr       chr_start	chr_end type    ref" > breakpoint_coordinates_juv.txt
grep "JUV" $1 >> breakpoint_coordinates_juv.txt

echo "chr       chr_start	chr_end type    ref" > breakpoint_coordinates_rea.txt
grep "REA" $1 >> breakpoint_coordinates_rea.txt
