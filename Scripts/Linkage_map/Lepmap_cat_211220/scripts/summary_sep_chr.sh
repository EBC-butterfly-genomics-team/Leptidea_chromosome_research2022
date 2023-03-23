#script to evaluate lod score in LepMap3

INPUT_PATH=.
#INPUT_DATA=$INPUT_PATH/data_f.call
OUTPUT_PATH=$INPUT_PATH/maps.splitchrom
PREFIX=fam_5_nomask
MAPS=30
MAX_LG=70

#gleaning the data
#ls $OUTPUT_PATH/map.* > $OUTPUT_PATH/list_sep_chr.txt
(echo "LG";seq 0 $MAX_LG) > $OUTPUT_PATH/maps.summary.txt

#for file in $(cat $OUTPUT_PATH/list_sep_chr.txt)
for i in $(seq 1 $MAPS) 
do 
echo $OUTPUT_PATH/map.$i
sort $OUTPUT_PATH/map.$i |uniq -c |sort -k2 -g |awk 'NR==1{print $5};NR>1{print $1}' |paste $OUTPUT_PATH/maps.summary.txt - > $OUTPUT_PATH/maps.summary.txt.tmp && mv $OUTPUT_PATH/maps.summary.txt.tmp $OUTPUT_PATH/maps.summary.txt
done
​
echo "Finished"
date
​

