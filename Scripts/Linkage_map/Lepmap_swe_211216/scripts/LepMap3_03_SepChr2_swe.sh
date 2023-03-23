#script to evaluate lod score in LepMap3

INPUT_PATH=.
INPUT_DATA=$INPUT_PATH/bin.map_order_header.call

PREFIX=swe

OUTPUT_PATH=$INPUT_PATH/sep_chr_${PREFIX}


#run SepChromosomes with different lodLimits to assign optimal LG
#use either output from ParentCall or Filtering2

mkdir $OUTPUT_PATH/
echo ”Running SeparateChromosomes2”
date

for i in {1..30}
do
echo lodLimit${i}
#zcat $OUTPUT_PATH/$INPUT_DATA | 
java -Xmx2048m -cp /Applications/lepmap3/bin SeparateChromosomes2 \
 data=$INPUT_DATA\
 lodLimit=${i}\
 distortionLod=1\
 numThreads=2\
 > $OUTPUT_PATH/${PREFIX}.${i}.map  2> $OUTPUT_PATH/${PREFIX}.${i}.log
done

echo ”Finished SeparateChromosomes2”
date

#gleaning the data
(echo "LG";seq 0 40) > $OUTPUT_PATH/${PREFIX}_sepchr_lod.txt

for lg in {1..30}
do
echo $lg
sort $OUTPUT_PATH/${PREFIX}.${lg}.map | uniq -c | sort -k2 -g |  awk 'NR==1{print $5};NR>1{print $1}' | paste $OUTPUT_PATH/${PREFIX}_sepchr_lod.txt - > $OUTPUT_PATH/${PREFIX}_sepchr_lod_prel.txt && mv $OUTPUT_PATH/${PREFIX}_sepchr_lod_prel.txt $OUTPUT_PATH/${PREFIX}_sepchr_lod.txt
done

echo ”Finished”
date

#check resultfile in r
