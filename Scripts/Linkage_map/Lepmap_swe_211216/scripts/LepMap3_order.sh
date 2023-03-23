#script for multiple MarkerOrder runs
#OBS! Have to change nr of iterations and nr of linkage groups in the loop and in loop retrieving maps

#specify input and output files and directories
#Change these !!!
#prefix and main directory
PREFIX=swe

#input path for main directory
INPUT_PATH=.

#Called data from ParentCall or Filtering
DATA_CALL=bin.map_order_header.call

#lodLimit SepChrom
LOD_LIM=12

#lodLimit JoinSingles
LOD_LIM_JS=8

#number of linkage groups
LG=29



INPUT_DATA=$INPUT_PATH/$DATA_CALL
OUTPUT_PATH=$INPUT_PATH/OrderMarker_${LOD_LIM}_${LOD_LIM_JS}_${PREFIX}_3

mkdir $OUTPUT_PATH

#the map from JoinSingles that is most optimal
MAP_FILE=$INPUT_PATH/JoinSingles_map_${LOD_LIM}_${PREFIX}/${PREFIX}_${LOD_LIM}_${LOD_LIM_JS}.js.map_mod_z_filt1_sep_filt2


#make a file with genome position for all markers
#cut -f1-2 $INPUT_DATA | awk 'NR>7{print $0}' > $INPUT_PATH/snps_${DATA_CALL}.txt

#run ordermarker

#5 iterations
for iter in {1..1}
do 
#for nr of lg
for lg in $(seq 1 1 $LG)
do

java -Xmx2048m -cp /Applications/lepmap3/bin OrderMarkers2\
 map=$MAP_FILE\
 data=$INPUT_DATA\
 numThreads=2\
 recombination2=0\
 chromosome=${lg} \
 > $OUTPUT_PATH/${PREFIX}_order_${lg}_${iter}.txt 2> $OUTPUT_PATH/${PREFIX}_order_${lg}_${iter}.log
wait

#maps the markers to genomic coordinates
awk '(NR==FNR){s[NR]=$0}(NR!=FNR){if ($1 in s) $3=s[$1];print}' $INPUT_PATH/snps.txt $OUTPUT_PATH/${PREFIX}_order_${lg}_${iter}.txt > $OUTPUT_PATH/${PREFIX}_order_${lg}_${iter}.mapped.txt

done
done


#if no iterations (i=1) and comment away likelihood comparisons
iter=1

#grep "likelihood" $OUTPUT_PATH/*mapped.txt > $OUTPUT_PATH/likelihoods.txt
#make a list of best likelihoods
#sort -k7 $OUTPUT_PATH/likelihoods.txt | sort -k4 | awk 'NR%5==1' | sort -gk4 > $OUTPUT_PATH/list_best_likelihoods.txt

#OBS!! Set nr according to nr of lg
for i in $(seq 1 1 $LG); do 
#file=$(awk -v i=$i 'NR==i' $OUTPUT_PATH/list_best_likelihoods.txt| cut -f1 -d ":")
awk -v i=$i 'NR>3{print $1, $2, $3, $4, $5=i}' $OUTPUT_PATH/${PREFIX}_order_${i}_${iter}.mapped.txt | sed 's/HiC_scaffold_//g' |sed 's/*//g' >> $OUTPUT_PATH/order_all.txt
done

awk 'BEGIN{print "marker_nr male_position scaffold position lg"}{print $0}' $OUTPUT_PATH/order_all.txt > $OUTPUT_PATH/${PREFIX}_order_all.table
