#filter out large scaffolds from data.call

#bin the markers and remove high nr of snps

awk 'BEGIN{print "#binned markers"}(NR>7){if (prevc != $1 || $2-prevp >= 1000) {++n;prevp=$2;prevc=$1}; print n}' data_sc.call >bin.map
uniq -c bin.map |awk '{print $1}'| sort | uniq -c | sort -gk2
  90 1
 122 2
 177 3
 179 4
 232 5
 232 6
 331 7
 328 8
 337 9
 351 10
 301 11
 266 12
 250 13
 233 14
 167 15
 145 16
 132 17
 100 18
  81 19
  69 20
  42 21
  32 22
  38 23
  20 24
  16 25
  16 26
  19 27
  17 28
  10 29
   3 30
   8 31
   5 32
   5 33
   3 34
   2 35
   2 36
   1 37
   2 38
   1 39
   2 40
   1 41
   1 46
   1 48
   1 58
   1 60
   1 62
   1 81

#filter out the tail with many snps per 1000bp probably repeats
uniq -c bin.map |awk '$1>18 {print $2}' |awk '(NR==FNR){a[$1]=$0} (NR!=FNR) {if ($1 in a) print (FNR-1)}' - bin.map |awk 'NR==FNR{ a[$1]=$0} NR!=FNR {if ((FNR-7) in a)next; print $0}' - data_sc.call > data_sc_filt.call

wc -l data_sc_filt.call 
   37507 data_sc_filt.call

#run LepMap Filtering2, with dataTolerance=0.00001


#filter for informative in each family
awk -f additional_scripts/inf.awk data_f.call > inf.txt


#run sep chrom for each family, infMask 2
############
T2
lodlim 3: 25lg merged 5/27, 18/25, 21/28, (not 11/26) split sc 7
lodlim 4: 25lg 5/27, 18/25, 21/28, (not 11/26) split sc 7
lodlim 5-9: 25lg 5/27, 18/25, 21/28, (not 11/26) split sc 7
lodlim 10: 25lg 5/27, 18/25, 21/28, (not 11/26) split sc 7, next lg is a mixed part of 21/28

awk 'NR>6{print $1}' data_f.call |paste - sep_chr_T2/swe_T2.9.map | awk '$2>0' |uniq -c |sort -gk3
   1 HiC_scaffold_20	1
   3 HiC_scaffold_17	1
  23 HiC_scaffold_1	1
  28 HiC_scaffold_1	1
  64 HiC_scaffold_6	1
 146 HiC_scaffold_19	1
  22 HiC_scaffold_4	2
  42 HiC_scaffold_4	2
  62 HiC_scaffold_4	2
  19 HiC_scaffold_13	3
  95 HiC_scaffold_13	3
  11 HiC_scaffold_2	4
  24 HiC_scaffold_2	4
  72 HiC_scaffold_2	4
   5 HiC_scaffold_5	5
  13 HiC_scaffold_27	5
  17 HiC_scaffold_5	5
  18 HiC_scaffold_27	5
  49 HiC_scaffold_5	5
  44 HiC_scaffold_10	6
  53 HiC_scaffold_10	6
  11 HiC_scaffold_11	7
  13 HiC_scaffold_11	7
  20 HiC_scaffold_11	7
  39 HiC_scaffold_11	7
   2 HiC_scaffold_4	8
  14 HiC_scaffold_21	8
  14 HiC_scaffold_28	8
  21 HiC_scaffold_28	8
  29 HiC_scaffold_21	8
   2 HiC_scaffold_26	9
   2 HiC_scaffold_3	9
   3 HiC_scaffold_3	9
   6 HiC_scaffold_3	9
  11 HiC_scaffold_3	9
  16 HiC_scaffold_3	9
  38 HiC_scaffold_3	9
   1 HiC_scaffold_12	10
   7 HiC_scaffold_12	10
   9 HiC_scaffold_12	10
   9 HiC_scaffold_12	10
  12 HiC_scaffold_12	10
  40 HiC_scaffold_12	10
   4 HiC_scaffold_28	11
   7 HiC_scaffold_17	11
  19 HiC_scaffold_17	11
  44 HiC_scaffold_17	11
   2 HiC_scaffold_8	12
  21 HiC_scaffold_8	12
  49 HiC_scaffold_8	12
   1 HiC_scaffold_18	13
   9 HiC_scaffold_18	13
  11 HiC_scaffold_25	13
  15 HiC_scaffold_18	13
  27 HiC_scaffold_25	13
  63 HiC_scaffold_23	14
   1 HiC_scaffold_16	15
   1 HiC_scaffold_2	15
   3 HiC_scaffold_16	15
  17 HiC_scaffold_16	15
  19 HiC_scaffold_16	15
  20 HiC_scaffold_16	15
   2 HiC_scaffold_14	16
   2 HiC_scaffold_14	16
   3 HiC_scaffold_14	16
  25 HiC_scaffold_14	16
  27 HiC_scaffold_14	16
  10 HiC_scaffold_15	17
  11 HiC_scaffold_15	17
  16 HiC_scaffold_15	17
  19 HiC_scaffold_15	17
   5 HiC_scaffold_7	18
  50 HiC_scaffold_7	18
   5 HiC_scaffold_9	19
   7 HiC_scaffold_9	19
  20 HiC_scaffold_9	19
  23 HiC_scaffold_9	19
   1 HiC_scaffold_10	20
   1 HiC_scaffold_4	20
   2 HiC_scaffold_26	20
   4 HiC_scaffold_26	20
  39 HiC_scaffold_26	20
   2 HiC_scaffold_22	21
   4 HiC_scaffold_22	21
  41 HiC_scaffold_22	21
   1 HiC_scaffold_24	22
  46 HiC_scaffold_24	22
   6 HiC_scaffold_20	23
   7 HiC_scaffold_20	23
  29 HiC_scaffold_20	23
   5 HiC_scaffold_7	24
  31 HiC_scaffold_7	24
  10 HiC_scaffold_29	25
  13 HiC_scaffold_29	25
   8 HiC_scaffold_3	26
   8 HiC_scaffold_14	27
   7 HiC_scaffold_3	28
   6 HiC_scaffold_14	29
   6 HiC_scaffold_20	30
   6 HiC_scaffold_26	31


#first mask all not inf in this family
awk '{$1=0};($7>0) {$1=1} {print $1}' inf.txt > inf_markers_T2_group.map
#run join singles to map9

#remove all linking to more then one lg

#run Ordermarker
#mask1 ok, but few markers
#mask13 ok, lots of spurious maerkes at ends remove manually
awk '{$6=1}1' T2/OrderMarker_swe_T2_noiter_mask13/swe_T2_order_all.table > T2/OrderMarker_swe_T2_noiter_mask13/swe_T2_order_all_mod.table

#change to 0 all to be removed
awk '$6==0{print $1}' T2/OrderMarker_swe_T2_noiter_mask13/swe_T2_order_all_mod.table >  T2/OrderMarker_swe_T2_noiter_mask13/markers_to_remove.txt
awk 'NR==FNR {a[$1]=$0} NR!=FNR {if (FNR-1 in a) $1=0;print $0}' T2/OrderMarker_swe_T2_noiter_mask13/markers_to_remove.txt T2/JoinSingles_map_swe_T2_9_noiter/map_prel_T2_noiter.map > T2/JoinSingles_map_swe_T2_9_noiter/map_prel_T2_noiter_filtr1.map

#split Z
awk 'NR>6{print $1}' data_f.call |paste - T2/JoinSingles_map_swe_T2_9_noiter/map_prel_T2_noiter_filtr1.map | grep -n "HiC_scaffold_6" |head -n1
8949:HiC_scaffold_6	0

awk 'NR>6{print $1}' data_f.call |paste - T2/JoinSingles_map_swe_T2_9_noiter/map_prel_T2_noiter_filtr1.map | grep -n "HiC_scaffold_6" |tail -n1
10304:HiC_scaffold_6	0

awk '$1==1 && NR>8000 && NR<11000 {$1=26}1' T2/JoinSingles_map_swe_T2_9_noiter/map_prel_T2_noiter_filtr1.map | awk '$1==1 && NR>11000  {$1=27}1' > T2/JoinSingles_map_swe_T2_9_noiter/map_prel_T2_noiter_filtr1_3Z.map

#run ordermarkers and eval with calculate intervals
#check order
#remove markers with intervals >20 and single markers in wrong lg
awk '$7==0 {print $4}' T2/OrderMarker_swe_T2_eval1_int/order_all_int_mod.txt >> T2/markers_to_remove.txt

#run ordermarkers 10 runs
#remove non-inf markers at ends
#run eval order

#check in r
#visualise with Ideogram (r)


#########
T3

awk 'NR>6{print $1}' data_f.call |paste - sep_chr_T3/swe_T3.5.map | awk '$2>0' |uniq -c |sort -gk3

map.3 20lg: merging 16 24 10 7, 21/28 + 18, 5/27, 25 sep, 11 sep, 26 only 2 markers, lg 21 split sc9, lg22 split sc11
map.4 24lg: merging 5/27, 21/28, 25 sep, 11 sep, 18 sep, 26 only 2 markers, lg25 split sc9, lg 26 split sc16
map.5 24lg: merging 5/27, 21/28, 25 sep, 11 sep, 18 sep, 26 only 2 markers (lg 43), lg25 split sc9, lg 26 split sc19
map.7 24lg: merging 5/27, 21/28, 25 sep, 11 sep, 18 sep, 26 not linked, 29 not linked, lg25 split sc9, lg 26 split 18



#run join singles to map5
#first mask all not inf in this family
awk '{$1=0};($3>0) {$1=1} {print $1}' inf.txt > inf_markers_T3_group.map

awk 'NR>6{print $1}' data_f.call |paste - T3/JoinSingles_map_swe_T3_5_noiter/swe_T3_5_4.js.map | awk '$2>0' |cut -f 1,2 |sort -gk2 |uniq -c
 227 HiC_scaffold_1	1
   1 HiC_scaffold_10	1
   3 HiC_scaffold_17	1
 235 HiC_scaffold_19	1
   2 HiC_scaffold_28	1
   2 HiC_scaffold_3	1
   2 HiC_scaffold_4	1
   2 HiC_scaffold_5	1
 195 HiC_scaffold_6	1
 287 HiC_scaffold_2	2
   1 HiC_scaffold_28	2
   2 HiC_scaffold_26	3
 280 HiC_scaffold_7	3
   1 HiC_scaffold_10	4
   1 HiC_scaffold_27	4
 257 HiC_scaffold_4	4
   3 HiC_scaffold_12	5
 149 HiC_scaffold_21	5
 102 HiC_scaffold_28	5
   1 HiC_scaffold_29	5
   3 HiC_scaffold_4	5
   1 HiC_scaffold_7	5
  58 HiC_scaffold_27	6
 176 HiC_scaffold_5	6
   1 HiC_scaffold_6	6
 220 HiC_scaffold_12	7
   1 HiC_scaffold_13	8
   2 HiC_scaffold_18	8
 134 HiC_scaffold_25	8
   1 HiC_scaffold_5	8
 180 HiC_scaffold_14	9
 171 HiC_scaffold_11	10
  34 HiC_scaffold_26	10
 172 HiC_scaffold_17	11
   1 HiC_scaffold_21	11
 163 HiC_scaffold_9	12
 143 HiC_scaffold_18	13
   1 HiC_scaffold_4	14
 188 HiC_scaffold_8	14
 173 HiC_scaffold_15	15
 117 HiC_scaffold_23	16
   2 HiC_scaffold_18	17
 110 HiC_scaffold_29	17
 177 HiC_scaffold_10	18
 115 HiC_scaffold_16	19
   1 HiC_scaffold_18	19
  89 HiC_scaffold_22	20
  97 HiC_scaffold_24	21
 135 HiC_scaffold_3	22
  66 HiC_scaffold_20	23
 101 HiC_scaffold_13	24
   1 HiC_scaffold_8	24

#adds 26 to 11

Varying amount of fem inf 
awk '$3==2 && $1=="HiC_scaffold_26"' inf.txt |wc -l
       6
Karins-MacBook-Pro-3:07_LepMak3r_noradtag_swe_211216_fam karin$ awk '$4==2 && $1=="HiC_scaffold_26"' inf.txt |wc -l
      55
Karins-MacBook-Pro-3:07_LepMak3r_noradtag_swe_211216_fam karin$ awk '$5==2 && $1=="HiC_scaffold_26"' inf.txt |wc -l
      54
Karins-MacBook-Pro-3:07_LepMak3r_noradtag_swe_211216_fam karin$ awk '$6==2 && $1=="HiC_scaffold_26"' inf.txt |wc -l
      11
Karins-MacBook-Pro-3:07_LepMak3r_noradtag_swe_211216_fam karin$ awk '$7==2 && $1=="HiC_scaffold_26"' inf.txt |wc -l
     131
Karins-MacBook-Pro-3:07_LepMak3r_noradtag_swe_211216_fam karin$ awk '$8==2 && $1=="HiC_scaffold_26"' inf.txt |wc -l
      33

#remove match to several different lg
awk 'NF>2' T3/JoinSingles_map_swe_T3_5_noiter/swe_T3_5_5.js.map |wc -l
      83

awk 'NR>1 && NF>2 {$1=0}1' T3/JoinSingles_map_swe_T3_5_noiter/swe_T3_5_5.js.map > T3/JoinSingles_map_swe_T3_5_noiter/map_prel_T3_noiter.map


#run ordermarkers
#
#remove non inf

#split Z
awk '$1==1 && NR>8000 && NR<11000 {$1=25}1' T3/JoinSingles_map_swe_T3_5_noiter/map_prel_T3_noiter.map | awk '$1==1 && NR>11000  {$1=26}1' > T3/JoinSingles_map_swe_T3_5_noiter/map_prel_T3_noiter_3Z.map

awk '$6==0 {print $1}' T3/OrderMarker_swe_T3_noiter_mask13/order_all_mod.table > T3/markers_to_remove.txt

awk 'NR==FNR {a[$1]=$0} NR!=FNR {if (FNR-1 in a) $1=0;print $0}' T3/markers_to_remove.txt T3/JoinSingles_map_swe_T3_5_noiter/map_prel_T3_noiter_3Z.map > T3/JoinSingles_map_swe_T3_5_noiter/map_prel_T3_noiter_3Z_filtr2.map

#run ordermarkers 10 runs
#remove non-inf markers at ends
#run eval order

#check in r
#visualise with Ideogram (r)


###
T4


#sep chr 
Lodlim 5: 26lg only 28/21 merged, lg27 is split sc22
Lodlim 6: 25lg only 28/21 merged, lg8 is split in small pieces

#run join singles to map5
#first mask all not inf in this family
awk '{$1=0};($4>0) {$1=1} {print $1}' inf.txt > inf_markers_T4_group.map

#small part of 27 joins sc5

#remove most uncertain (maps to multiple lg)
awk 'NF>2 ' T4/JoinSingles_map_swe_T4_5_noiter/swe_T4_5_5.js.map |wc -l
     217
awk 'NR>1 && NF>2 {$1=0}1' T4/JoinSingles_map_swe_T4_5_noiter/swe_T4_5_5.js.map > T4/JoinSingles_map_swe_T4_5_noiter/map_prel_T4_noiter.map

#order
#remove markers at ends and single markers in wrong lg
awk '$6==0 {print $1}' T4/OrderMarker_swe_T4_noiter_mask13/order_all_mod.table > T4/markers_to_remove.txt

awk 'NR==FNR {a[$1]=$0} NR!=FNR {if (FNR-1 in a) $1=0;print $0}' T4/markers_to_remove.txt T4/JoinSingles_map_swe_T4_5_noiter/map_prel_T4_noiter.map  > T4/JoinSingles_map_swe_T4_5_noiter/map_prel_T4_noiter_filtr2.map

#run ordermarkers 10 runs
#remove non-inf markers at ends
#run eval order

#check in r
#visualise with Ideogram (r)


######
T5

#sepchrom
Lodlim 3: 24lg merging 14/24, 5/27, 21/28, 11/26, splits 7, 18 sep, 25 sep, sc3 merging with Zs
Lodlim 4: 26lg 5/27, 21/28, 11/26, 18 sep, 25 sep, splits 7, splits 11, lg 23 many small pieces from scaffolds, sc3 merging with Z
Lodlim 5: 26lg 5/27, 21/28, 11/26, 18 sep, 25 sep, splits 7, splits 11, lg 25 many small pieces from scaffolds, sc3 (5 markers) merging with Z
Lodlim 6: 26lg 5/27, 21/28, 11/26, 18 sep, 25 sep, splits 7, splits 11, lg 25 many small pieces from scaffolds, sc3 (5 markers) merging with Z
Lodlim 7: 26lg 5/27, 21/28, 11/26, 18 sep, 25 sep, splits 7, splits 11, lg 26 many small pieces from scaffolds, sc3 missing
Lodlim 8: 27lg same as above, lg27 parts of sc 19, sc3 missing
Lodlim 9: 25lg, lg25 small pieces, no Z, sc3 missing

#run join singles to all without size lim
lg 33 and 45 accumulate from sc3

#set all >25 to lg 0 except 33
#set lg 26 to 0, lg 33 to 26, and then all smaller to 0 

awk '$1==26 {$1=0}1' T5/sep_chr_T5/swe_T5.7.map | awk '$1==33 {$1=26}1' | awk '$1>26 {$1=0}1' > T5/sep_chr_T5/swe_T5.7_mod.map

#run join singles
#noiter only few marker sc3
#iter >200 markers

#run Ordermarkers mask13
#run sep lg26
#add to table
awk 'NR>3{print $1, $2, $3, $4, $5=26}' T5/OrderMarker_swe_T5_mask13_lg26/swe_T5_order_1_1.mapped.txt | sed -E 's/HiC_scaffold_//g' | sed 's/\*//g' >> T5/OrderMarker_swe_T5_noiter_mask13/swe_T5_order_all.table 

#split Z
awk '$1==1 && NR>8000 && NR<11000 {$1=27}1' T5/JoinSingles_map_swe_T5_7_noiter_mod/map_prel_T5_noiter.map | awk '$1==1 && NR>11000  {$1=28}1' > T5/JoinSingles_map_swe_T5_7_noiter_mod/map_prel_T5_noiter_3Z.map 

#remove markers
awk '$6==0 {print $1}' T5/OrderMarker_swe_T5_noiter_mask13/order_all_mod.txt > T5/markers_to_remove.txt

awk 'NR==FNR {a[$1]=$0} NR!=FNR {if (FNR-1 in a) $1=0;print $0}' T5/markers_to_remove.txt T5/JoinSingles_map_swe_T5_7_noiter_mod/map_prel_T5_noiter_3Z.map > T5/JoinSingles_map_swe_T5_7_noiter_mod/map_prel_T5_noiter_3Z_filtr2.map

#add markers from lg26 (sc3) to map
awk '$3==3 && $5==26 {print $1}' T5/OrderMarker_swe_T5_noiter_mask13/order_all_mod.txt | awk 'NR==FNR {a[$1]=$0} NR!=FNR {if (FNR-1 in a) $1=26;print $0}' - T5/JoinSingles_map_swe_T5_7_noiter_mod/map_prel_T5_noiter_3Z_filtr2.map > T5/JoinSingles_map_swe_T5_7_noiter_mod/map_prel_T5_noiter_3Z_filtr2_mod.map

#run order 10 runs

grep "likelihood" T5/*mapped.txt |sort -k7| awk 'NR%5==1' | sort -gk4 

#remove non-inf markers at ends
#run eval order


#########
T6 to little information

#########
S25 to little info

Lodlim 3 only 19lg but some of them are: 5/27, 21/28, sep 11 and 26, sep 18 and 25, 


