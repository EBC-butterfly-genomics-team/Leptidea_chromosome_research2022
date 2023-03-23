#script for multiple MarkerOrder runs
#OBS! Have to change nr of iterations

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
LOD_LIM=$2

#lodLimit JoinSingles
#LOD_LIM_JS=

#number of linkage groups
LG=$3



INPUT_DATA=$INPUT_PATH/$DATA_CALL
OUTPUT_PATH=$INPUT_PATH/${FAMILY}/OrderMarker_${PREFIX}_eval1

mkdir $OUTPUT_PATH
mkdir ${OUTPUT_PATH}_int

#the map from JoinSingles that is most optimal
MAP_FILE=$INPUT_PATH/${FAMILY}/JoinSingles_map_${PREFIX}_${LOD_LIM}/map_prel_${FAMILY}_filt1_3Z.map

#make a file with genome position for all markers
cut -f1-2 $INPUT_DATA | awk 'NR>7{print $0}' > $INPUT_PATH/snps.txt

#run ordermarker (number of iterations)
for i in {1..1}
do 
#for nr of lg
for lg in $(seq 1 1 $LG)
do

java -Xmx2048m -cp /Applications/lepmap3/bin OrderMarkers2\
 map=$MAP_FILE\
 data=$INPUT_DATA\
 numThreads=2\
 recombination2=0\
 informativeMask=13\
 families=${FAMILY}\
 chromosome=${lg} \
 > $OUTPUT_PATH/${PREFIX}_order_${lg}_${i}.txt 2> $OUTPUT_PATH/${PREFIX}_order_${lg}_${i}.log
wait


java -Xmx2048m -cp /Applications/lepmap3/bin OrderMarkers2\
 evaluateOrder=$OUTPUT_PATH/${PREFIX}_order_${lg}_${i}.txt\
 data=$INPUT_DATA\
 calculateIntervals=${OUTPUT_PATH}_int/order_${lg}_intervals.txt\
 numThreads=2\
 recombination2=0\
 informativeMask=13\
 families=${FAMILY}\
 chromosome=${lg}\
 improveOrder=1\
 &> ${OUTPUT_PATH}_int/order_${lg}_int.log
wait

#maps the markers to genomic coordinates
awk '(NR==FNR){s[NR]=$0}(NR!=FNR){if ($1 in s) $4=s[$1];print}' $INPUT_PATH/snps.txt ${OUTPUT_PATH}_int/order_${lg}_intervals.txt > ${OUTPUT_PATH}_int/order_${lg}_intervals.mapped.txt

done
done


#if no iterations (i=1) and comment away likelihood comparisons
i=1

#grep "likelihood" $OUTPUT_PATH/*mapped.txt > $OUTPUT_PATH/likelihoods.txt
#make a list of best likelihoods
#sort -k7 $OUTPUT_PATH/likelihoods.txt | sort -k4 | awk 'NR%5==1' | sort -gk4 > $OUTPUT_PATH/list_best_likelihoods.txt

#OBS!! Set nr according to nr of lg
for lg in $(seq 1 1 $LG); do 
#file=$(awk -v i=$i 'NR==i' $OUTPUT_PATH/list_best_likelihoods.txt| cut -f1 -d ":")
awk -v lg=$lg '{print $4, $5, $6=lg, $1, $2, $3}' ${OUTPUT_PATH}_int/order_${lg}_intervals.mapped.txt | sed 's/HiC_scaffold_//g' |sed 's/\*//g' >> ${OUTPUT_PATH}_int/order_all_int.txt
done

