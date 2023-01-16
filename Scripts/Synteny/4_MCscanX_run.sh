#!/bin/bash -l

##SBATCH -A snic2022-5-34
##SBATCH -p core
##SBATCH -n 1
##SBATCH -t 1:00:00
##SBATCH -J mcscanx

cd /home/larshook/LarsH/MCScanX

./MCScanX bm_mc_lj_lr_ls_lc/bm_mc_lj_lr_ls_lc \
  -b 2 \
  -s 5 \
  -m 10 \
  -a

# -k  MATCH_SCORE, final score=MATCH_SCORE+NUM_GAPS*GAP_PENALTY (default: 50)
# -g  GAP_PENALTY, gap penalty (default: -1)
# -s  MATCH_SIZE, number of genes required to call a collinear block (default: 5)
# -e  E_VALUE, alignment significance (default: 1e-05)
# -m  MAX_GAPS, maximum gaps allowed (default: 25)
# -w  OVERLAP_WINDOW, maximum distance (# of genes) to collapse BLAST matches (default: 5)
# -a  only builds the pairwise blocks (.collinearity file)
# -b  patterns of collinear blocks. 0:intra- and inter-species (default); 1:intra-species; 2:inter-species
# -h  print this help page
