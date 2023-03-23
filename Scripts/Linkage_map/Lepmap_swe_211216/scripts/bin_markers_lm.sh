#custum notes with oneliners to bin markers for LepMap3 (after advise from P Rastas)
#input is the output from module ParentCall. Filtered to only keep chromosome size scaffolds

#bin , each bin 10000 bp
awk 'BEGIN{print "#binned markers"}(NR>7){if (prevc != $1 || $2-prevp >= 10000) {++n;prevp=$2;prevc=$1}; print n}' data_f_noSex5_29sc.call >bin.map

#filter for to many snps per radtag (bin)
uniq -c bin.map |awk '{print $1}'| sort | uniq -c | sort -gk2
 662 1
 373 2
 228 3
 165 4
  97 5
  75 6
  28 7
  22 8
  16 9
  11 10
   6 11
   4 12
   6 13
   1 14
   2 15
   1 17
   2 18
   1 19
   1 21


#filter bins with to many snps (here over 5)
uniq -c bin.map |awk '$1>5 {print $2}' |awk '(NR==FNR){a[$1]=$0} (NR!=FNR) {if ($1 in a) print (FNR-1)}' - bin.map |awk 'NR==FNR{ a[$1]=$0} NR!=FNR {if ((FNR-7) in a)next; print $0}' - data_f_noSex5_29sc.call > data_f_noSex5_29sc_filt.call
wc -l data_f_noSex5_29sc_filt.call 
    3243 data_f_noSex5_29sc_filt.call
wc -l data_f_noSex5_29sc.call
    4648 data_f_noSex5_29sc.call

#bin again to get correct marker nr from the filtered call
awk 'BEGIN{print "#binned markers"}(NR>7){if (prevc != $1 || $2-prevp >= 10000) {++n;prevp=$2;prevc=$1}; print n}' data_f_noSex5_29sc_filt.call >bin.map_filt 
wc -l bin.map_filt 
    3237 bin.map_filt

#ordermarker to get phased data from each bin
java -Xmx2048m -cp /Applications/lepmap3/bin OrderMarkers2 data=data_f_noSex5_29sc_filt.call map=bin.map_filt recombination1=0 recombination2=0 outputPhasedData=4 > bin.map_order 2> bin.map_order.log

#get input call
awk -f ../../scripts/order2data.awk bin.map_order > bin.map_order.call

#add header
awk 'NR==FNR && NR<8 {print } NR!=FNR {print}' data_f_noSex5_29sc_filt.call bin.map_order.call > bin.map_order_header.call

