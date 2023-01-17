#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 20
#SBATCH -t 3-00:00:00
#SBATCH -J optimize_augustus

module load bioinfo-tools
module load augustus/3.4.0

optimize_augustus.pl \
        --species=Lsin_Swe \
        SIN_Swe_rnd1.gbk.train \
        --cpus=20 \
        --kfold=20 \
        --AUGUSTUS_CONFIG_PATH=/home/larshook/LarsH/MAKER/SIN_Swe/Augustus/augustus_config \
        --UTR=on


#USAGE 1 --- single species parameter training and optimization (main usage for most users)
#optimize_augustus.pl --species=myspecies train.gb
#      myspecies                prefix of the species name
#      train.gb                 genbank file for training with bona fide gene structures

#OPTIONS
#    --metapars=metapars.cfg    metapars.cfg contains the names and their ranges of the
#                               meta parameters that are subject to optimization.
#                               (default: generic_metapars.cfg)
#    --rounds=r                 r is the number of rounds (default: 5)
#    --cpus=n                   n is the number of CPUs to use (default: 1)
#    --onlytrain=onlytrain.gb   an optional genbank file that is used in addition to train.gb
#                               but only for etrain not for intermediate evaluation of accuracy.
#                               These genes may e.g. be incomplete.
#    --kfold=k                  Make a k-fold cross validation (default: 8)
#    --pstep=p                  For integer and floating parameters start with p tests equidistributed
#                               in the allowed range of values (default: 5)
#    --AUGUSTUS_CONFIG_PATH=d   Specify the config directory d if not set as environment variable
#    --opt_trans_matrix=s       Optimize the transition matrix file s. s must be the transition file used.
#                               e.g. ../species/nt/generic/generic_trans_shadow_partial.pbl
#    --matrix_constraints=s     A file with try list, normed list and bindings.
#    --UTR=on                   Turn untranslated region model on for training and prediction.
#    --aug_exec_dir=d           Path to augustus and etraining executable. If not specified
#                               it must be in \$PATH environment variable.
#    --trainOnlyUtr=1           Use this option, if the exon, intron and intergenic models need not be trained. (default: 0)
#    --noTrainPars=1            Use this option, if the parameters to optimize do not affect training. The training step (etraining) is omitted completely. $
#    --sens_spec_bias=f         increase sensitivity weight by factor f. (default: 1)
