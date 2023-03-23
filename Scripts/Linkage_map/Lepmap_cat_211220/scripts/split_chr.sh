#splits chromosomes in separate sex chromosomes scaffold 1,3 and 4. 

#create a list of markers vs genomic positions for the binned data, this lists the "bins", the marker nr=NR and lists scaffold and position for each. 
awk 'NR>6 {print $1,$2}' data_f_52sc.call | paste bin_data_f_52sc.map - > snps_bin_vs_scaffold.txt

#the map have one header row, so that is why starting on 7th row in the call file. SNPS-file in this case also have a header line. 
zcat bin.map_order_header_filt.call.gz |awk 'NR>6{print $1}'|paste - JS_test_10/map.10_js5 |cut -f1,2| awk 'NR==FNR && NR>1 {a[NR-1]=$0} NR!=FNR { if ($1 in a) $4=a[$1]; print}' snps_bin_vs_scaffold.txt - |awk '$4=="HiC_scaffold_3" && $2==1 {$2=51} {print $0}' | awk '$4=="HiC_scaffold_4" && $2==1 {$2=52} {print $0}' > map.master_tmp

#manually change all markers in wrong scaffold to 0 if only single markers
#save as mod file

#print only the LG as input map file for Ordermarkers
awk 'NR==1 {print $0} NR>1 {print $2}' map.master_tmp_mod > map.master
