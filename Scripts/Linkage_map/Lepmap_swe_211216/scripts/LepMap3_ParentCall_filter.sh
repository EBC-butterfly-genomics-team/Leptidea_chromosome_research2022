#!/bin/bash -l


module load bioinfo-tools

PROG_DIR=programs
INPUT_DIR=link_map/output/07_lepmap
OUTPUT_DIR=$INPUT_DIR/call

POP=swe
VCF=${POP}.post
PEDIGREE=pedigree_${POP}.txt

cd $INPUT_DIR
mkdir $OUTPUT_DIR

java -cp $PROG_DIR/lep-map3-code/bin/ ParentCall2 data=$PEDIGREE postFile=$VCF ZLimit=2 removeNonInformative=1 | gzip > $OUTPUT_DIR/data.call.gz 2> $OUTPUT_DIR/parentCall.log

zcat $OUTPUT_DIR/data.call.gz | java -cp $PROG_DIR/lep-map3-code/bin/ Filtering2 data=- dataTolerance=0.00001 familyInformativeLimit=5 removeNonInformative=1 missingLimit=0.3 noSexFiltering=1 | gzip > $OUTPUT_DIR/data_f.call.gz 2> $OUTPUT_DIR/filtering.log

