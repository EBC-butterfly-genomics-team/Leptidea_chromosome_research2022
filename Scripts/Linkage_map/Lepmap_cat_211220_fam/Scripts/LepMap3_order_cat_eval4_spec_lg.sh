#script for multiple MarkerOrder runs
#OBS! Have to change nr of iterations and nr of linkage groups in the loop and in loop retrieving maps
#run with bash Desktop/Link_map/scripts/LepMap3_order_swe_eval3.sh family nr_of_lg

#specify input and output files and directories
#Change these !!!
#prefix and main directory

FAMILY=$1
PREFIX=cat_${FAMILY}

#input path for main directory
INPUT_PATH=.

#Called data from ParentCall or Filtering
DATA_CALL=data_f.call

#lodLimit SepChrom
#LOD_LIM=

#lodLimit JoinSingles
#LOD_LIM_JS=

#list of linkage groups
LG=($2)
#ex (1 2 4)



INPUT_DATA=$INPUT_PATH/$DATA_CALL
ORDER_DIR=$INPUT_PATH/${FAMILY}/OrderMarker_${PREFIX}_mask13_10run_int_eval3
OUTPUT_PATH=${ORDER_DIR}_mod

mkdir $OUTPUT_PATH

#make a file with genome position for all markers
#cut -f1-2 $INPUT_DATA | awk 'NR>7{print $0}' > $INPUT_PATH/snps_${DATA_CALL}.txt


#for nr of lg
for lg in ${LG[@]}
do
java -Xmx2048m -cp /Applications/lepmap3/bin OrderMarkers2\
 evaluateOrder=$ORDER_DIR/order_${lg}_intervals.txt_mod\
 calculateIntervals=$OUTPUT_PATH/order_${lg}_intervals.txt\
 improveOrder=1\
 data=$INPUT_DATA\
 numThreads=2\
 recombination2=0\
 informativeMask=13\
 families=${FAMILY}\
 chromosome=${lg}\
&> $OUTPUT_PATH/order_${lg}_int.log
wait

#maps the markers to genomic coordinates
awk '(NR==FNR){s[NR]=$0}(NR!=FNR){if ($1 in s) $4=s[$1];print}' $INPUT_PATH/snps.txt $OUTPUT_PATH/order_${lg}_intervals.txt > $OUTPUT_PATH/order_${lg}_intervals.mapped.txt

done


for lg in $(seq 1 1 $LG); do 
awk -v lg=$lg '{print $4, $5, $6=lg, $1, $2, $3}' $OUTPUT_PATH/order_${lg}_intervals.mapped.txt | sed 's/HiC_scaffold_//g' |sed 's/\*//g' >> $OUTPUT_PATH/order_all_int.txt
done

