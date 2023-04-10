#!/bin/bash


#############
#### 103 ####
#############

assembly=P14502_103

echo " " > temp_sin_intra_fusion_karyotype.txt

for i in 19 25 21 28;
do
 echo "$assembly" $(grep -w "HiC_scaffold_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+30000000}' >> temp_sin_intra_fusion_karyotype.txt
done

#############
#### 104 ####
#############

assembly=P14502_104

for i in 3 6;
do
 echo "$assembly" $(grep -w "HiC_scaffold_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+60000000}' >> temp_sin_intra_fusion_karyotype.txt
done

##############
#### DToL ####
##############

assembly=DToL

for i in 39 38 12 4 23;
do
 echo "$assembly" $(grep -w "Chr_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+20000000}' >> temp_sin_intra_fusion_karyotype.txt
done

#############
#### 105 ####
#############

assembly=P14502_105

for i in 34 38 48 52 35 44 20;
do
 echo "$assembly" $(grep -w "HiC_scaffold_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+17000000}' >> temp_sin_intra_fusion_karyotype.txt
done

#############
#### 115 ####
#############

assembly=P14502_115

for i in 10 15 21 6 5;
do
 echo "$assembly" $(grep -w "HiC_scaffold_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+13000000}' >> temp_sin_intra_fusion_karyotype.txt
done

#############
#### 111 ####
#############

assembly=P14502_111

for i in 28 2 15 13 8 22 26 21 17 14;
do
 echo "$assembly" $(grep -w "HiC_scaffold_"$i"" "$assembly"_karyotype.txt) |\
        awk '{print $1, $2, $3, $3+2000000} ' >> temp_sin_intra_fusion_karyotype.txt
done


############################################################################################################################################################


echo "assembly	chr	start	end	colz" > sin_intra_fusion_karyotype.txt

#############
#### 103 ####
#############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_sin_intra_fusion_karyotype.txt |\
        awk -v OFS="\t" -v offset=20000000 '{if ($1=="P14502_103" && $2=="HiC_scaffold_19") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="P14502_103" && $2!="HiC_scaffold_19") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> sin_intra_fusion_karyotype.txt

#############
#### 104 ####
#############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_sin_intra_fusion_karyotype.txt |\
        awk -v OFS="\t" -v offset=34000000 '{if ($1=="P14502_104" && $2=="HiC_scaffold_3") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="P14502_104" && $2!="HiC_scaffold_3") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> sin_intra_fusion_karyotype.txt

##############
#### DToL ####
##############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_sin_intra_fusion_karyotype.txt |\
        awk -v OFS="\t" -v offset=17000000 '{if ($1=="DToL" && $2=="Chr_39") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="DToL" && $2!="Chr_39") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> sin_intra_fusion_karyotype.txt

#############
#### 105 ####
#############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_sin_intra_fusion_karyotype.txt |\
        awk -v OFS="\t" -v offset=14000000 '{if ($1=="P14502_105" && $2=="HiC_scaffold_34") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="P14502_105" && $2!="HiC_scaffold_34") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> sin_intra_fusion_karyotype.txt

#############
#### 115 ####
#############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_sin_intra_fusion_karyotype.txt |\
        awk -v OFS="\t" -v offset=10000000 '{if ($1=="P14502_115" && $2=="HiC_scaffold_10") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="P14502_115" && $2!="HiC_scaffold_10") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> sin_intra_fusion_karyotype.txt

#############
#### 111 ####
#############

awk '{print $1, $2, $3, sum[$1]; sum[$1] += $4}' temp_sin_intra_fusion_karyotype.txt |\
        awk -v OFS="\t" -v offset=4000000 '{if ($1=="P14502_111" && $2=="HiC_scaffold_28") \
                print $1, $2, offset, $3+offset, "grey";
                        else if ($1=="P14502_111" && $2!="HiC_scaffold_28") \
                                print $1, $2, $4+offset, $3+$4+offset, "grey"}' >> sin_intra_fusion_karyotype.txt


sed -i 's/HiC_scaffold_//;s/Chr_//' sin_intra_fusion_karyotype.txt
