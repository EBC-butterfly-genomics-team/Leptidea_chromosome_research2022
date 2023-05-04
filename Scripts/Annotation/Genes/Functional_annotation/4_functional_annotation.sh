#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 30:00
#SBATCH -J maker

module load bioinfo-tools
module load maker/3.01.04    

# integrates result of interproscan and swissprot blast with annotation gff and fasta files...

ASSEMBLY=P14502_103
GFF_PATH=/home/larshook/LarsH/MAKER/SIN_Swe


SWISS=/home/larshook/SCRIPTS/INTERPROSCAN/uniprot_sprot.fasta
BLAST_RES=/home/larshook/LarsH/INTERPROSCAN/swissprot-"$ASSEMBLY".FINAL-deduped-nuc.filtered.all.maker.proteins.out
INTERPRO=/home/larshook/LarsH/INTERPROSCAN/"$ASSEMBLY".tsv

ipr_update_gff "$GFF_PATH"/"$ASSEMBLY".FINAL-deduped-nuc.filtered.all.maker.gff "$INTERPRO" > "$GFF_PATH"/"$ASSEMBLY".FINAL-deduped-nuc.filtered.all.maker.domain.gff
iprscan2gff3 "$INTERPRO" "$GFF_PATH"/"$ASSEMBLY".FINAL-deduped-nuc.filtered.all.maker.gff >> "$GFF_PATH"/"$ASSEMBLY".FINAL-deduped-nuc.filtered.all.maker.domain.gff

maker_functional_gff "$SWISS" "$BLAST_RES" "$GFF_PATH"/"$ASSEMBLY".FINAL-deduped-nuc.filtered.all.maker.domain.gff > "$GFF_PATH"/"$ASSEMBLY".FINAL-deduped-nuc.filtered.all.maker.domain.putative_function.gff
maker_functional_fasta "$SWISS" "$BLAST_RES" "$GFF_PATH"/"$ASSEMBLY".FINAL-deduped-nuc.filtered.all.maker.proteins.simplified.fasta > "$GFF_PATH"/"$ASSEMBLY".FINAL-deduped-nuc.filtered.all.maker.proteins.simplified.putative_function.fasta
maker_functional_fasta "$SWISS" "$BLAST_RES" "$GFF_PATH"/"$ASSEMBLY".FINAL-deduped-nuc.filtered.all.maker.transcripts.simplified.fasta > "$GFF_PATH"/"$ASSEMBLY".FINAL-deduped-nuc.filtered.all.maker.transcripts.simplified.putative_function.fasta
