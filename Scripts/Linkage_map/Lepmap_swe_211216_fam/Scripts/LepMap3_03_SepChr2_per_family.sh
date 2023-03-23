#script to evaluate lod score in LepMap3

INPUT_PATH=.
INPUT_DATA=$INPUT_PATH/data_f.call

#loop through each family
for FAMILY in $(awk '{print $2}' list_families_swe.txt)
do

PREFIX=swe_${FAMILY}

OUTPUT_PATH=$INPUT_PATH/sep_chr_${FAMILY}



#run SepChromosomes with different lodLimits to assign optimal LG
#use either output from ParentCall or Filtering2

mkdir $OUTPUT_PATH/
echo ”Running SeparateChromosomes2”
date

for i in {1..30}
do
echo lodLimit${i}
#zcat $OUTPUT_PATH/data.call.gz | 
java -Xmx2048m -cp /Applications/lepmap3/bin SeparateChromosomes2 \
 data=$INPUT_DATA\
 families=${FAMILY}\
 lodLimit=${i}\
 informativeMask=2\
 distortionLod=1\
 numThreads=2\
 > $OUTPUT_PATH/${PREFIX}.${i}.map  2> $OUTPUT_PATH/${PREFIX}.${i}.log
done

echo ”Finished SeparateChromosomes2”
date

#gleaning the data
(echo "LG";seq 0 70) > $OUTPUT_PATH/${PREFIX}_sepchr_lod.txt

for lg in {1..30}
do
echo $lg
sort $OUTPUT_PATH/${PREFIX}.${lg}.map | uniq -c | sort -k2 -g |  awk 'NR==1{print $5};NR>1{print $1}' | sed 's/"lodLimit="//g' |paste $OUTPUT_PATH/${PREFIX}_sepchr_lod.txt - > $OUTPUT_PATH/${PREFIX}_sepchr_lod_prel.txt && mv $OUTPUT_PATH/${PREFIX}_sepchr_lod_prel.txt $OUTPUT_PATH/${PREFIX}_sepchr_lod.txt
done

done
echo ”Finished”
date

#check resultfile in r
