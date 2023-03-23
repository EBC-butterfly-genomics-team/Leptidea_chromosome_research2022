#script for LepMap3
#use after Pileup2Likelihoods

INPUT_PATH=.

PREFIX=swe

OUTPUT_PATH=$INPUT_PATH

#vcf or posterior file from 
VCF_FILE=../07_LepMak3r_noradtag_swe_211216/post

#pedigree file for pop
PEDIGREE_FILE=$INPUT_PATH/pedigree_${PREFIX}.txt

#mkdir $OUTPUT_PATH

#run ParentCall2
echo ”Running ParentCall2”
date

gunzip $VCF_FILE.gz

java -Xmx2048m -cp /Applications/lepmap3/bin ParentCall2\
 data=$PEDIGREE_FILE \
 posteriorFile=$VCF_FILE \
 removeNonInformative=1 \
 ZLimit=2 \
 familyLimit=2\
 > $OUTPUT_PATH/data.call 2> $OUTPUT_PATH/$PREFIX.ParentCall.log

gzip $VCF_FILE
echo ”Finished ParentCall2”
date


#filter, not recommended for one family
echo ”Running Filtering2”
date

java -cp /Applications/lepmap3/bin Filtering2\
 data=$OUTPUT_PATH/data.call\
 dataTolerance=0.00001\
 removeNonInformative=1\
 missingLimit=0.3\
 convert2Biallelic=1\
 noSexFiltering=1\
> $OUTPUT_PATH/data_f.call 2> $OUTPUT_PATH/$PREFIX.Filtering.log

echo ”Finished Filtering2”
date

