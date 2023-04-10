#!/bin/bash


#############
#### 112 ####
#############

assembly=P14502_112

echo " " > temp_juv_intra_fusion_karyotype.txt

for i in 5 42 43 28 38;
do
 echo "$assembly" $(grep -w "HiC_scaffold_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+10000000}' >> temp_juv_intra_fusion_karyotype.txt
done


#############
#### 111 ####
#############

assembly=P14502_111

for i in 24 25 41 17;
do
 echo "$assembly" $(grep -w "HiC_scaffold_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+12500000}' >> temp_juv_intra_fusion_karyotype.txt
done


#############
#### 103 ####
#############

assembly=P14502_103

for i in 5 13 9 8 28;
do
 echo "$assembly" $(grep -w "HiC_scaffold_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+2500000}' >> temp_juv_intra_fusion_karyotype.txt
done


##############
#### DToL ####
##############

assembly=DToL

for i in 21 14 16 24 7 23;
do
 echo "$assembly" $(grep -w "Chr_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+5000000}' >> temp_juv_intra_fusion_karyotype.txt
done


#############
#### 105 ####
#############

assembly=P14502_105

for i in 12 14 10 19 17 20;
do
 echo "$assembly" $(grep -w "HiC_scaffold_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+5000000}' >> temp_juv_intra_fusion_karyotype.txt
done


#############
#### 115 ####
#############

assembly=P14502_115

for i in 4 26 5 6 8;
do
 echo "$assembly" $(grep -w "HiC_scaffold_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+2500000}' >> temp_juv_intra_fusion_karyotype.txt
done



############################################################################################################################################################


echo "assembly	chr	start	end	colz" > juv_intra_fusion_karyotype.txt

#############
#### 112 ####
#############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_juv_intra_fusion_karyotype.txt |\
        awk -v OFS="\t" -v offset=26500000 '{if ($1=="P14502_112" && $2=="HiC_scaffold_5") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="P14502_112" && $2!="HiC_scaffold_5") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> juv_intra_fusion_karyotype.txt


#############
#### 111 ####
#############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_juv_intra_fusion_karyotype.txt |\
        awk -v OFS="\t" -v offset=21500000 '{if ($1=="P14502_111" && $2=="HiC_scaffold_24") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="P14502_111" && $2!="HiC_scaffold_24") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> juv_intra_fusion_karyotype.txt


#############
#### 103 ####
#############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_juv_intra_fusion_karyotype.txt |\
        awk -v OFS="\t" -v offset=6500000 '{if ($1=="P14502_103" && $2=="HiC_scaffold_2") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="P14502_103" && $2!="HiC_scaffold_2") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> juv_intra_fusion_karyotype.txt


##############
#### DToL ####
##############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_juv_intra_fusion_karyotype.txt |\
        awk -v OFS="\t" -v offset=11500000 '{if ($1=="DToL" && $2=="Chr_1") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="DToL" && $2!="Chr_1") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> juv_intra_fusion_karyotype.txt


#############
#### 105 ####
#############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_juv_intra_fusion_karyotype.txt |\
        awk -v OFS="\t" -v offset=16500000 '{if ($1=="P14502_105" && $2=="HiC_scaffold_2") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="P14502_105" && $2!="HiC_scaffold_2") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> juv_intra_fusion_karyotype.txt


#############
#### 115 ####
#############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_juv_intra_fusion_karyotype.txt |\
        awk -v OFS="\t" -v offset=4000000 '{if ($1=="P14502_115" && $2=="HiC_scaffold_1") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="P14502_115" && $2!="HiC_scaffold_1") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> juv_intra_fusion_karyotype.txt


sed -i 's/HiC_scaffold_//;s/Chr_//' juv_intra_fusion_karyotype.txt
