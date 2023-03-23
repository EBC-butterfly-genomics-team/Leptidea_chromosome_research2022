#! /bin/bash -l
#SBATCH -A snic2021-5-20
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J Linkage_map_lept_ref
#SBATCH -e Linkage_map_lept_ref_index_cat.error
#SBATCH --mail-user karin.nasvall@ebc.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools 
module load bwa/0.7.17

cd /proj/uppoff2020002/private/group_member_backups/KarinN/projects/2018_02_linkmap_lept/data/assembly_cat_male

bwa index P14502_105.FINAL-deduped-nuc.filtered.fasta
