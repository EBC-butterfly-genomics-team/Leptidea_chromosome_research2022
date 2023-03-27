#!/bin/bash

# get nr of genes and sizes, number of exon and sizes, number of CDS and sizes, genes on chr, genes with functional prediction and protein domains



#### predicted genes #####

echo "predicted genes" > gene_annotation_stats_s.table4.txt
echo "" >> gene_annotation_stats_s.table4.txt

echo "LsinapisSweM: " >> gene_annotation_stats_s.table4.txt
genes_Lsin_swe=$(awk '{if ($3=="gene") print}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_swe/gff/LsinapisSweM.all.maker.genes.gff | wc -l)
echo $genes_Lsin_swe >> gene_annotation_stats_s.table4.txt

echo "LsinapisSpaM: " >> gene_annotation_stats_s.table4.txt
genes_Lsin_spa=$(awk '{if ($3=="gene") print}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_spa/gff/LsinapisSpaM.all.maker.genes.gff | wc -l)
echo $genes_Lsin_spa >> gene_annotation_stats_s.table4.txt

echo "LjuvernicaM: " >> gene_annotation_stats_s.table4.txt
genes_Ljuv=$(awk '{if ($3=="gene") print}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Ljuv/gff/LjuvernicaM.all.maker.genes.gff | wc -l)
echo $genes_Ljuv >> gene_annotation_stats_s.table4.txt

echo "LrealiM: " >> gene_annotation_stats_s.table4.txt
genes_Lrea=$(awk '{if ($3=="gene") print}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lrea/gff/LrealiM.all.maker.genes.gff | wc -l)
echo $genes_Lrea >> gene_annotation_stats_s.table4.txt

echo "LsinapisDToL: " >> gene_annotation_stats_s.table4.txt
genes_DToL=$(awk '{if ($3=="gene") print}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_DToL/gff/Lsin_DToL.all.maker.genes.gff | wc -l)
echo $genes_DToL >> gene_annotation_stats_s.table4.txt



##### % genes on chromosomes #####

echo "" >> gene_annotation_stats_s.table4.txt
echo "% genes on chromosomes" >> gene_annotation_stats_s.table4.txt
echo "" >> gene_annotation_stats_s.table4.txt

echo "LsinapisSweM: " >> gene_annotation_stats_s.table4.txt
chr_genes_Lsin_swe=$(for i in {1..29}; do grep -w "HiC_scaffold_"$i"" /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_swe/gff/LsinapisSweM.all.maker.genes.gff | awk '{if ($3=="gene") print}'; done | wc -l)
echo $chr_genes_Lsin_swe $genes_Lsin_swe | awk '{print $1/$2}' >> gene_annotation_stats_s.table4.txt

echo "LsinapisSpaM: " >> gene_annotation_stats_s.table4.txt
chr_genes_Lsin_spa=$(for i in {1..52}; do grep -w "HiC_scaffold_"$i"" /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_spa/gff/LsinapisSpaM.all.maker.genes.gff | awk '{if ($3=="gene") print}'; done | wc -l)
echo $chr_genes_Lsin_spa $genes_Lsin_spa | awk '{print $1/$2}' >> gene_annotation_stats_s.table4.txt

echo "LjuvernicaM: " >> gene_annotation_stats_s.table4.txt
chr_genes_Ljuv=$(for i in {1..42}; do grep -w "HiC_scaffold_"$i"" /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Ljuv/gff/LjuvernicaM.all.maker.genes.gff | awk '{if ($3=="gene") print}'; done | wc -l)
echo $chr_genes_Ljuv $genes_Ljuv | awk '{print $1/$2}' >> gene_annotation_stats_s.table4.txt

echo "LrealiM: " >> gene_annotation_stats_s.table4.txt
chr_genes_Lrea=$(for i in {1..26}; do grep -w "HiC_scaffold_"$i"" /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lrea/gff/LrealiM.all.maker.genes.gff | awk '{if ($3=="gene") print}'; done | wc -l)
echo $chr_genes_Lrea $genes_Lrea | awk '{print $1/$2}' >> gene_annotation_stats_s.table4.txt

echo "LsinapisDToL: " >> gene_annotation_stats_s.table4.txt
chr_genes_DToL=$(for i in {1..48}; do grep -w "Chr_"$i"" /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_DToL/gff/Lsin_DToL.all.maker.genes.gff | awk '{if ($3=="gene") print}'; done | wc -l)
echo $chr_genes_DToL $genes_DToL | awk '{print $1/$2}' >> gene_annotation_stats_s.table4.txt



# genes with functional predictions

echo "" >> gene_annotation_stats_s.table4.txt
echo "genes with functional prediction" >> gene_annotation_stats_s.table4.txt
echo "" >> gene_annotation_stats_s.table4.txt

echo "LsinapisSweM: " >> gene_annotation_stats_s.table4.txt
grep ">" /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_swe/fasta/LsinapisSweM.all.maker.proteins.fasta | grep -v "Protein of unknown function" | wc -l >> gene_annotation_stats_s.table4.txt

echo "LsinapisSpaM: " >> gene_annotation_stats_s.table4.txt
grep ">" /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_spa/fasta/LsinapisSpaM.all.maker.proteins.fasta | grep -v "Protein of unknown function" | wc -l >> gene_annotation_stats_s.table4.txt

echo "LjuvernicaM: " >> gene_annotation_stats_s.table4.txt
grep ">" /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Ljuv/fasta/LjuvernicaM.all.maker.proteins.fasta | grep -v "Protein of unknown function" | wc -l >> gene_annotation_stats_s.table4.txt

echo "LrealiM: " >> gene_annotation_stats_s.table4.txt
grep ">" /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lrea/fasta/LrealiM.all.maker.proteins.fasta | grep -v "Protein of unknown function" | wc -l >> gene_annotation_stats_s.table4.txt

echo "LsinapisDToL: " >> gene_annotation_stats_s.table4.txt
grep ">" /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_DToL/fasta/Lsin_DToL.all.maker.proteins.fasta | grep -v "Protein of unknown function" | wc -l >> gene_annotation_stats_s.table4.txt


##### gene sizes #####

awk '{if ($3=="gene") print $5-$4}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_swe/gff/LsinapisSweM.all.maker.genes.gff > swe_gene_sizes.txt
awk '{if ($3=="gene") print $5-$4}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_spa/gff/LsinapisSpaM.all.maker.genes.gff > spa_gene_sizes.txt
awk '{if ($3=="gene") print $5-$4}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Ljuv/gff/LjuvernicaM.all.maker.genes.gff > juv_gene_sizes.txt
awk '{if ($3=="gene") print $5-$4}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lrea/gff/LrealiM.all.maker.genes.gff > rea_gene_sizes.txt
awk '{if ($3=="gene") print $5-$4}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_DToL/gff/Lsin_DToL.all.maker.genes.gff > DToL_gene_sizes.txt


##### cds sizes #####

# awk '{if ($3=="CDS") print $5-$4}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_swe/gff/LsinapisSweM.all.maker.genes.gff > swe_CDS_sizes.txt
# awk '{if ($3=="CDS") print $5-$4}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_spa/gff/LsinapisSpaM.all.maker.genes.gff > spa_CDS_sizes.txt
# awk '{if ($3=="CDS") print $5-$4}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Ljuv/gff/LjuvernicaM.all.maker.genes.gff > juv_CDS_sizes.txt
# awk '{if ($3=="CDS") print $5-$4}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lrea/gff/LrealiM.all.maker.genes.gff > rea_CDS_sizes.txt
# awk '{if ($3=="CDS") print $5-$4}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_DToL/gff/Lsin_DToL.all.maker.genes.gff > DToL_CDS_sizes.txt


# exons per gene

awk '{if ($3=="exon") print}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_swe/gff/LsinapisSweM.all.maker.genes.gff | sed 's/ID=/ /; s/-RA/ /' | awk '{a[$9]++;} END {for (i in a) print a[i]}' > swe_number_of_exons.txt
awk '{if ($3=="exon") print}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_spa/gff/LsinapisSpaM.all.maker.genes.gff | sed 's/ID=/ /; s/-RA/ /' | awk '{a[$9]++;} END {for (i in a) print a[i]}' > spa_number_of_exons.txt
awk '{if ($3=="exon") print}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Ljuv/gff/LjuvernicaM.all.maker.genes.gff | sed 's/ID=/ /; s/-RA/ /' | awk '{a[$9]++;} END {for (i in a) print a[i]}' > juv_number_of_exons.txt
awk '{if ($3=="exon") print}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lrea/gff/LrealiM.all.maker.genes.gff | sed 's/ID=/ /; s/-RA/ /' | awk '{a[$9]++;} END {for (i in a) print a[i]}' > rea_number_of_exons.txt
awk '{if ($3=="exon") print}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_DToL/gff/Lsin_DToL.all.maker.genes.gff | sed 's/ID=/ /; s/-RA/ /' | awk '{a[$9]++;} END {for (i in a) print a[i]}' > DToL_number_of_exons.txt


##### exon sizes #####

awk '{if ($3=="exon") print $5-$4}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_swe/gff/LsinapisSweM.all.maker.genes.gff > swe_exon_sizes.txt
awk '{if ($3=="exon") print $5-$4}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_spa/gff/LsinapisSpaM.all.maker.genes.gff > spa_exon_sizes.txt
awk '{if ($3=="exon") print $5-$4}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Ljuv/gff/LjuvernicaM.all.maker.genes.gff > juv_exon_sizes.txt
awk '{if ($3=="exon") print $5-$4}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lrea/gff/LrealiM.all.maker.genes.gff > rea_exon_sizes.txt
awk '{if ($3=="exon") print $5-$4}' /proj/uppoff2020002/private/result_files/Leptidea/Annotation/Lsin_DToL/gff/Lsin_DToL.all.maker.genes.gff > DToL_exon_sizes.txt
