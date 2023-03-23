#script to run sizelimit SepChrom and evaluate JoinSingles lod score in LepMap3
#run with: bash additional_scripts/LepMap3_JoinSingles_cat.sh family lodlim sizelimit

#prefix and main directory
FAMILY=$1
PREFIX=swe_${FAMILY}

#Called data from ParentCall or Filtering
DATA_CALL=data_f.call

#lodLimit SepChrom
LOD_LIM=$2

#sizeLimit for SepChrom
MIN_LG_SIZE=$3

#lodlim join singles
MIN_LOD=$(($LOD_LIM-3))
MAX_LOD=$LOD_LIM


INPUT_PATH=.
INPUT_DATA=$INPUT_PATH/$DATA_CALL
OUTPUT_PATH=$INPUT_PATH/${FAMILY}/JoinSingles_map_${PREFIX}_${LOD_LIM}

mkdir $OUTPUT_PATH

#run Sepchr with sizelim
java -Xmx2048m -cp /Applications/lepmap3/bin SeparateChromosomes2 \
 data=$INPUT_DATA\
 lodLimit=${LOD_LIM}\
 families=${FAMILY}\
 distortionLod=1\
 numThreads=2\
 informativeMask=2\
 sizeLimit=$MIN_LG_SIZE\
 > $OUTPUT_PATH/${PREFIX}.${LOD_LIM}.map  2> $OUTPUT_PATH/${PREFIX}.${LOD_LIM}.log

#run JoinSingles to assigning all markers to LG with different lodLimits

mkdir $OUTPUT_PATH
echo ”Running JoinSingles2”
date

# for n in $(seq $MIN_LOD 1 $MAX_LOD)
# do

for i in $(seq $MIN_LOD 1 $MAX_LOD)
do
echo lodlim${n}_${i}
java -Xmx2048m -cp /Applications/lepmap3/bin JoinSingles2All\
 data=$INPUT_DATA\
 map=$OUTPUT_PATH/${PREFIX}.${LOD_LIM}.map\
 lodLimit=${i}\
 distortionLod=1\
 numThreads=2\
 mask=inf_markers_${FAMILY}_group.map\
 iterate=0\
  > $OUTPUT_PATH/${PREFIX}_${LOD_LIM}_${i}.js.map 2> $OUTPUT_PATH/${PREFIX}_${LOD_LIM}_${i}.js.log
done
#done


echo ”Finished JoinSingles2”
date

#gleaning the data
ls $OUTPUT_PATH/${PREFIX}_${LOD_LIM}_*.js.map > $OUTPUT_PATH/list_js.txt
(echo "LG";seq 0 60) > $OUTPUT_PATH/${PREFIX}_js_lod.txt

for file in $(cat $OUTPUT_PATH/list_js.txt)
do

echo $file
cut -f1 $file | sort | uniq -c | sort -k2 -g |  awk 'NR==1{print $6};NR>1{print $1}' | paste $OUTPUT_PATH/${PREFIX}_js_lod.txt - > $OUTPUT_PATH/${PREFIX}_js_lod_prel.txt && mv $OUTPUT_PATH/${PREFIX}_js_lod_prel.txt $OUTPUT_PATH/${PREFIX}_js_lod.txt
done

echo ”Finished”
date

#check resultfile in r
