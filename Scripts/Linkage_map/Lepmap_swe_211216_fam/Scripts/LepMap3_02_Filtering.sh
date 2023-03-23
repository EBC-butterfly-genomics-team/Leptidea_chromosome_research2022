#script for LepMap3

INPUT_PATH=.

PREFIX=swe

OUTPUT_PATH=$INPUT_PATH

DATA_FILE=data_filt1.call


#filter, not recommended for one family
echo ”Running Filtering2”
date

java -cp /Applications/lepmap3/bin Filtering2\
 data=$OUTPUT_PATH/$DATA_FILE\
 dataTolerance=0.00001\
 removeNonInformative=1\
 convert2Biallelic=1\
 noSexFiltering=1\
> $OUTPUT_PATH/data_f.call 2> $OUTPUT_PATH/$PREFIX.Filtering.log

echo ”Finished Filtering2”
date
