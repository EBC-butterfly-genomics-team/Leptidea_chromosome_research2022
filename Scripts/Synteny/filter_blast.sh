#!/bin/bash


# select 5 best blast results per gene in each alignment and make concatenated blast-input file for MCScanX


cd /home/larshook/LarsH/MCScanX
mkdir bm_mc_lj_lr_ls_lc


cd /home/larshook/LarsH/SYNTENY/BLAST

for file in *.out;
do

  awk 'a[$1]++ < 5' "$file" > trimmed-"$file"

done

cat trimmed-*.out > /home/larshook/LarsH/MCScanX/bm_mc_lj_lr_ls_lc/bm_mc_lj_lr_ls_lc.blast
