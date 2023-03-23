#filter away if >5 snps per binned markers
#first list the LG we do not want. The LG are also the NR (FNR) of the bin.map_order_header.call (subtrakt the first 7 rows).
uniq -c bin_data_f_52sc.map |awk '$1>5 {print $2}' | awk 'NR==FNR{ a[$1]=$0} NR!=FNR {if ((FNR-7) in a)next; print $0}' - bin.map_order_header.call > bin.map_order_header_filt.call

