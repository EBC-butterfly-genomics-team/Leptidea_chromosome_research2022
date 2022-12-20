#!/bin/bash -l
#SBATCH -J finalize_assembly
#SBATCH -p core
#SBATCH -n 6
#SBATCH -t 10:00:00
#SBATCH -A snic2022-5-34


# this script runs the script 'run-asm-pipeline-post-review.sh' from 3ddna to finalize assemblies corrected with Juicebox

# load modules

module load bioinfo-tools
module load java/sun_jdk1.7.0_25		
module load gnuparallel/20170122

# Change according to project

MAIN_PATH=/proj/uppstore2017185/b2014034
PROJECT_PATH=nobackup/Lars/Leptidea_genome_2020/Genome_fasta_databases
SCRIPT_PATH=nobackup/Lars/Leptidea_genome_2020/SCRIPTS/FINALIZE_HiC
DATA_PATH=private/raw_data/Genome_assembly_data
FASTA_PATH=N.Backstrom_19_10/01-Results/assemblies

MND_PATH=HiC_Lars_Hook/delivery03527/INBOX/P14503/01-Results/01-juicer
MND=merged_nodups.txt

##### Change according to assembly #####

#HiC		Review/fasta
#P14503_103	P14502_103
#P14503_104	P14502_104
#P14503_105	P14502_105
#P14503_201	P14502_106
#P14503_301	P14502_111
#P14503_302	P14502_112
#P14503_305	P14502_115
#P14503_401	P14502_116

HIC_ASSEMBLY=P14503_103
REVIEW=P14502_103.final.review.assembly
FASTA=P14502_103.fasta

##########


# copy files to SNIC_TMP

cp -r $MAIN_PATH/$SCRIPT_PATH/3d-dna-master $SNIC_TMP
cp $MAIN_PATH/$DATA_PATH/$FASTA_PATH/$FASTA $SNIC_TMP

#cp $MAIN_PATH/$PROJECT_PATH/JUICEBOX/v1.2/$REVIEW $SNIC_TMP
cp $MAIN_PATH/$PROJECT_PATH/JUICEBOX/LM_corrected/$REVIEW $SNIC_TMP


cp $MAIN_PATH/$DATA_PATH/$MND_PATH/$HIC_ASSEMBLY/aligned/$MND $SNIC_TMP

cd $SNIC_TMP

# run finalizing script and copy output back

./3d-dna-master/run-asm-pipeline-post-review.sh \
	-r $REVIEW \
	--build-gapped-map \
	--sort-output \
	$FASTA \
	$MND

#cp *.hic *.assembly *.fasta /proj/uppoff2020002/private/group_member_backups/LarsH/HiC_ASSEMBLY_V1.2
cp *.hic *.assembly *.fasta /proj/uppoff2020002/private/group_member_backups/LarsH/HiC_ASSEMBLY_LM_corrected/FINAL



##################################################################################################################

#USAGE: ./run-asm-pipeline-post-review.sh [options] -r <review.assembly> <path_to_input_fasta> <path_to_input_mnd>

#DESCRIPTION:
#This is a script to finalize assemblies (represented in input by draft fasta and deduplicated list of alignments of Hi-C reads to this fasta as produced by the Juicer pipeline) into chromosome-length fasta sequences, after review in Juicebox Assembly Tools Module (represented by review.assembly file). The script will produce an output fasta file, a Hi-C map of the final assembly, and a few supplementary annotation files to help review the result in Juicebox.
#ARGUMENTS:
#path_to_input_fasta                     Specify file path to draft assembly fasta file.
#path_to_input_mnd                       Specify path to deduplicated list of alignments of Hi-C reads to the draft assembly fasta as produced by the Juicer pipeline: the merged_nodups file (mnd).
#
#OPTIONS:
#-r|--review path_to_review_assembly
#                        Path to review \".assembly\" file.
#-i|--input input_size
#                        Specifies threshold input contig/scaffold size (default is 15000). Contigs/scaffolds smaller than input_size are going to be ignored.
#			 Only matters if running including seal. Should be the same as used for running the original script.
#-s|--stage stage
#                        Assembly steps to run on top of the reviewed assembly, can be seal and finalize. Default is finalize.
#-q|--mapq mapq
#                        Mapq threshold for final map(s) visualization, default is 1.
#-g|--gap_size gap_size
#                        Gap size to be added between scaffolded sequences in the final chromosome-length scaffolds (default is 500).
#--sort-output
#                        Option to sort the chromosome-length scaffolds by size, in the descending order.
#--build-gapped-map
#                        Option to output an additional contact map corresponding to the assembly after the gaps have been added between scaffolded sequences.
#-h|--help                       Shows this help. Type --help for a full set of options.
