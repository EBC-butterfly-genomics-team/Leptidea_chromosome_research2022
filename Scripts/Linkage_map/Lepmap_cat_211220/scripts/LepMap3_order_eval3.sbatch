#! /bin/bash -l
#SBATCH -A snic2021-5-20
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J linkage_map_lept_lepmap_eval3
#SBATCH -e linkage_map_lept_lepmaker_cat_eval3
#SBATCH --mail-user karin.nasvall@ebc.uu.se
#SBATCH --mail-type=ALL

cd /proj/uppstore2017185/b2014034_nobackup/Karin/link_map/output/07_LepMak3r_cat_211220

#specify input and output files and directories
#Change these !!!
#prefix and main directory
PREFIX=cat

#input path for main directory
INPUT_PATH=.

#Called data from ParentCall or Filtering
DATA_CALL=bin.map_order_header.call.gz

#lodLimit SepChrom
LOD_LIM=10

#lodLimit JoinSingles
LOD_LIM_JS=5

#number of linkage groups
LG=53


INPUT_DATA=$INPUT_PATH/$DATA_CALL
OUTPUT_PATH=$INPUT_PATH/OrderMarker_${LOD_LIM}_${LOD_LIM_JS}_${PREFIX}_eval3

mkdir $OUTPUT_PATH

#the map from JoinSingles that is most optimal
MAP_FILE=JS_test_10/map.10_js5_mod_chr_eval2
#$INPUT_PATH/JS_test_${LOD_LIM}/map.${LOD_LIM}_js${LOD_LIM_JS}_mod_chr


#make a file with genome position for all markers
#cut -f1-2 $INPUT_DATA | awk 'NR>7{print $0}' > $INPUT_PATH/snps_${DATA_CALL}.txt

#run ordermarker

#5 iterations
for iter in {1..1}
do 
#for nr of lg
for lg in $(seq 1 1 $LG)
do

zcat $INPUT_DATA |java -cp LM3 OrderMarkers2\
 map=$MAP_FILE\
 data=-\
 numThreads=2\
 recombination2=0\
 chromosome=${lg}\
 > $OUTPUT_PATH/${PREFIX}_order_${lg}_${iter}.txt 2> $OUTPUT_PATH/${PREFIX}_order_${lg}_${iter}.log
wait

done
done

wait

#evaluate order and get intervals
#for nr of lg
for lg in $(seq 1 1 $LG)
do

zcat $INPUT_DATA |java -cp LM3 OrderMarkers2\
 data=-\
 evaluateOrder=$OUTPUT_PATH/${PREFIX}_order_${lg}_1.txt\
 calculateIntervals=$OUTPUT_PATH/order_${lg}_intervals.txt\
 numThreads=2\
 recombination2=0\
 chromosome=${lg} \
 improveOrder=1\
 &> $OUTPUT_PATH/${PREFIX}_order_${lg}_int.log
wait

#maps the markers to genomic coordinates
awk '(NR==FNR){s[NR]=$0}(NR!=FNR){if ($1 in s) $4=s[$1];print}' $INPUT_PATH/snps.txt $OUTPUT_PATH/order_${lg}_intervals.txt > $OUTPUT_PATH/order_${lg}_intervals.mapped.txt

done


#if no iterations (i=1) and comment away likelihood comparisons
i=1

#grep "likelihood" $OUTPUT_PATH/*mapped.txt > $OUTPUT_PATH/likelihoods.txt
#make a list of best likelihoods
#sort -k7 $OUTPUT_PATH/likelihoods.txt | sort -k4 | awk 'NR%5==1' | sort -gk4 > $OUTPUT_PATH/list_best_likelihoods.txt

#OBS!! Set nr according to nr of lg
for lg in $(seq 1 1 $LG); do 
#file=$(awk -v i=$i 'NR==i' $OUTPUT_PATH/list_best_likelihoods.txt| cut -f1 -d ":")
awk -v lg=$lg '{print $4, $5, $6=lg, $1, $2, $3}' $OUTPUT_PATH/order_${lg}_intervals.mapped.txt | sed 's/HiC_scaffold_//g' |sed 's/\*//g' >> $OUTPUT_PATH/order_all_int_eval3.txt
done
