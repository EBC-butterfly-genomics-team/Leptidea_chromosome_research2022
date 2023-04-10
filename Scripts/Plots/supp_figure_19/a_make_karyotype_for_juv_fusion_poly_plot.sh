#!/bin/bash


#############
#### 112 ####
#############

assembly=P14502_112

echo " " > temp_juv_fusion_poly_karyotype.txt

for i in 40 20;
do
 echo "$assembly" $(grep -w "HiC_scaffold_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+7000000}' >> temp_juv_fusion_poly_karyotype.txt
done


#############
#### 111 ####
#############

assembly=P14502_111

for i in 27 37;
do
 echo "$assembly" $(grep -w "HiC_scaffold_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+7000000}' >> temp_juv_fusion_poly_karyotype.txt
done


#############
#### 103 ####
#############

assembly=P14502_103

for i in 17 23;
do
 echo "$assembly" $(grep -w "HiC_scaffold_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+3000000}' >> temp_juv_fusion_poly_karyotype.txt
done


##############
#### DToL ####
##############

assembly=DToL

for i in 33 8 47;
do
 echo "$assembly" $(grep -w "Chr_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+2500000}' >> temp_juv_fusion_poly_karyotype.txt
done


#############
#### 105 ####
#############

assembly=P14502_105

for i in 32 26 45;
do
 echo "$assembly" $(grep -w "HiC_scaffold_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+6000000}' >> temp_juv_fusion_poly_karyotype.txt
done


#############
#### 115 ####
#############

assembly=P14502_115

for i in 19 25 21;
do
 echo "$assembly" $(grep -w "HiC_scaffold_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+2000000}' >> temp_juv_fusion_poly_karyotype.txt
done



############################################################################################################################################################


echo "assembly	chr	start	end	colz" > juv_fusion_poly_karyotype.txt

#############
#### 112 ####
#############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_juv_fusion_poly_karyotype.txt |\
        awk -v OFS="\t" -v offset=16500000 '{if ($1=="P14502_112" && $2=="HiC_scaffold_5") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="P14502_112" && $2!="HiC_scaffold_5") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> juv_fusion_poly_karyotype.txt


#############
#### 111 ####
#############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_juv_fusion_poly_karyotype.txt |\
        awk -v OFS="\t" -v offset=17000000 '{if ($1=="P14502_111" && $2=="HiC_scaffold_24") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="P14502_111" && $2!="HiC_scaffold_24") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> juv_fusion_poly_karyotype.txt


#############
#### 103 ####
#############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_juv_fusion_poly_karyotype.txt |\
        awk -v OFS="\t" -v offset=12000000 '{if ($1=="P14502_103" && $2=="HiC_scaffold_2") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="P14502_103" && $2!="HiC_scaffold_2") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> juv_fusion_poly_karyotype.txt


##############
#### DToL ####
##############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_juv_fusion_poly_karyotype.txt |\
        awk -v OFS="\t" -v offset=10000000 '{if ($1=="DToL" && $2=="Chr_1") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="DToL" && $2!="Chr_1") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> juv_fusion_poly_karyotype.txt


#############
#### 105 ####
#############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_juv_fusion_poly_karyotype.txt |\
        awk -v OFS="\t" -v offset=11500000 '{if ($1=="P14502_105" && $2=="HiC_scaffold_2") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="P14502_105" && $2!="HiC_scaffold_2") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> juv_fusion_poly_karyotype.txt


#############
#### 115 ####
#############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_juv_fusion_poly_karyotype.txt |\
        awk -v OFS="\t" -v offset=4000000 '{if ($1=="P14502_115" && $2=="HiC_scaffold_1") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="P14502_115" && $2!="HiC_scaffold_1") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> juv_fusion_poly_karyotype.txt


sed -i 's/HiC_scaffold_//;s/Chr_//' juv_fusion_poly_karyotype.txt
