#!/bin/bash -l


module load bioinfo-tools
module load samtools/1.9


#ls *.bam | tr "\n" " " > list_filtered_bam.txt

INPUT_PATH=output/04c_bwa_cf_q10_uniq_noradtag_swe
OUTPUT_PATH=output/04d_mpileup2likelihoods_swe

mkdir $OUTPUT_PATH

#cp to temp folder
cp $INPUT_PATH/*.bam $SNIC_TMP
cp $INPUT_PATH/mapping.txt $SNIC_TMP
cp $INPUT_PATH/list_filtered_files.txt $SNIC_TMP

cd $SNIC_TMP/

samtools mpileup -q 10 -Q 10 -s $(cat list_filtered_files.txt) > mpileup.txt
#backup result
cp $SNIC_TMP/mpileup.txt $OUTPUT_PATH/

java -cp ../programs/lep-map3-code/bin/ Pileup2Likelihoods pileup=mpileup.txt | gzip  > post.gz
#copy final result
cp $SNIC_TMP/post.gz $OUTPUT_PATH/
wait

#with default values (minCoverage=3, numLowerCoverage=0.3 (missing ind))
#usage: samtools mpileup -q 10 -Q10 -s $(cat sorted_bams)|java Pileup2Likelihoods [options] >post.txt
#options:
#         pileup=file          load pileup from a file [-]
#         mapping=file         load individual names (same order as bams) from a file [mapping.txt]
#         minCoverage=NUM      minimum coverage per individual [3]
#         numLowerCoverage=NUM number (or proportion) individuals allowed with lower than minCoverage [0.3]
#         minAlleleFreq=NUM    minimum number (or proportion) of an allele [0.1]
#         minQuality=NUM       minimum quality value [0.001]
#         minCoverageSum=NUM   minimum total (summed) coverage
