#script for multiple MarkerOrder runs
#OBS! Have to change nr of iterations and nr of linkage groups in the loop and in loop retrieving maps
#run with bash Desktop/Link_map/scripts/LepMap3_order_5_fam_noradtag_swe.sh lodlim_sepchrom lodlim_js

#specify input and output files and directories
#Change these !!!
#prefix and main directory

FAMILY=$1
PREFIX=swe_${FAMILY}

#input path for main directory
INPUT_PATH=.

#Called data from ParentCall or Filtering
DATA_CALL=data_f.call

#lodLimit SepChrom
LOD_LIM=$2

#lodLimit JoinSingles
#LOD_LIM_JS=$2

#number of linkage groups
LG=$3



INPUT_DATA=$INPUT_PATH/$DATA_CALL
OUTPUT_PATH=$INPUT_PATH/${FAMILY}/OrderMarker_${PREFIX}_mask13_10run

mkdir $OUTPUT_PATH

#the map from JoinSingles that is most optimal
MAP_FILE=$INPUT_PATH/${FAMILY}/JoinSingles_map_${PREFIX}_${LOD_LIM}/map_prel_${FAMILY}_filt1_3Z_filt2.map


#make a file with genome position for all markers
#cut -f1-2 $INPUT_DATA | awk 'NR>7{print $0}' > $INPUT_PATH/snps_${DATA_CALL}.txt

#run ordermarker

#5 iterations
for i in {1..10}
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

#maps the markers to genomic coordinates
#awk '(NR==FNR){s[NR]=$0}(NR!=FNR){if ($1 in s) $3=s[$1];print}' $INPUT_PATH/snps.txt $OUTPUT_PATH/${PREFIX}_order_${lg}_${i}.txt > $OUTPUT_PATH/${PREFIX}_order_${lg}_${i}.mapped.txt

done
done


#if no iterations (i=1) and comment away likelihood comparisons
#i=1

#grep "likelihood" $OUTPUT_PATH/*mapped.txt > $OUTPUT_PATH/likelihoods.txt
#make a list of best likelihoods
#sort -k7 $OUTPUT_PATH/likelihoods.txt | sort -k4 | awk 'NR%5==1' | sort -gk4 > $OUTPUT_PATH/list_best_likelihoods.txt

#OBS!! Set nr according to nr of lg
#for lg in $(seq 1 1 $LG); do 
#file=$(awk -v i=$i 'NR==i' $OUTPUT_PATH/list_best_likelihoods.txt| cut -f1 -d ":")
#awk -v lg=$lg 'NR>3{print $1, $2, $3, $4, $5=lg}' $OUTPUT_PATH/${PREFIX}_order_${lg}_${i}.mapped.txt | sed -E 's/HiC_scaffold_//g' | sed 's/\*//g' >> $OUTPUT_PATH/order_all.txt
#done

#awk 'BEGIN{print "marker_nr male_position scaffold position lg"}{print $0}' $OUTPUT_PATH/order_all.txt > $OUTPUT_PATH/${PREFIX}_order_all.table
