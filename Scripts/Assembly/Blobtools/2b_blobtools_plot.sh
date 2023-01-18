#!/bin/bash -l
#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 30:00
#SBATCH -J blobtools_plot_view

module load bioinfo-tools
module load blobtools/1.1.1

ASSEMBLY=P14502_103
MAIN_PATH=/proj/uppoff2020002/private/group_member_backups/LarsH/BLOBTOOLS

cp $MAIN_PATH/DB/$ASSEMBLY.FINAL-deduped-nuc.blobDB.json $SNIC_TMP
cd $SNIC_TMP

blobtools plot \
        -i $ASSEMBLY.FINAL-deduped-nuc.blobDB.json \
        -r order

blobtools view \
        -i $ASSEMBLY.FINAL-deduped-nuc.blobDB.json \
        --rank all --hits

cp *.txt *.png $MAIN_PATH


#    Options plot:
#        -h --help                   show this
#        -i, --infile BLOBDB         BlobDB file (created with "blobtools create")
#        --lib COVLIB                Plot only certain covlib(s). Separated by ","
#        --notitle                   Do not add filename as title to plot
#        --filelabel                 Label axis based on filenames
#        -p, --plotgroups INT        Number of (taxonomic) groups to plot, remaining groups are placed in 'other' [default: 7]
#        -l, --length INT            Minimum sequence length considered for plotting [default: 100]
#        --cindex                    Colour blobs by 'c index' [default: False]
#        -n, --nohit                 Hide sequences without taxonomic annotation [default: False]
#        -s, --noscale               Do not scale sequences by length [default: False]
#        --legend                    Plot legend of blobplot in separate figure
#        -m, --multiplot             Multi-plot. Print blobplot for each (taxonomic) group separately
#        --cumulative                Print plot after addition of each (taxonomic) group
#        --sort <ORDER>              Sort order for plotting [default: span] span: plot with decreasing span count: plot with decreasing count
#        --sort_first <L1,L2,...>    Labels that should always be plotted first, regardless of sort order ("no-hit,other,undef" is often a useful setting)
#        --hist <HIST>               Data for histograms [default: span] span  : span-weighted histograms count : count histograms
#        -r, --rank <RANK>           Taxonomic rank used for colouring of blobs [default: phylum] (Supported: species, genus, family, order, phylum, superkingdom)
#        -x, --taxrule <TAXRULE>     Taxrule which has been used for computing taxonomy (Supported: bestsum, bestsumorder) [default: bestsum]
#        --format FORMAT             Figure format for plot (png, pdf, eps, jpeg, ps, svg, svgz, tiff) [default: png]
#        --noblobs                   Omit blobplot [default: False]
#        --noreads                   Omit plot of reads mapping [default: False]
#        -o, --out PREFIX            Output prefix
#        --label GROUPS...           Relabel (taxonomic) groups, can be used several times. e.g. "A=Actinobacteria,Proteobacteria"
#        --colours COLOURFILE        File containing colours for (taxonomic) groups
#        --exclude GROUPS            Exclude these (taxonomic) groups (also works for 'other') e.g. "Actinobacteria,Proteobacteria,other"
#        --refcov <FILE>             File containing number of "total" and "mapped" reads per coverage file. (e.g.: bam0,900,100). If provided, info will be used in read co$
#        --catcolour <FILE>          Colour plot based on categories from FILE (format : "seq category").

#    Options view :
#        --h --help                  show this
#        -i, --input <BLOBDB>        BlobDB file (created with "blobtools create")
#        -o, --out <OUT>             Output prefix
#        -l, --list <LIST>           List of sequence names (file).
#        -x, --taxrule <TAXRULE>     Taxrule used for computing taxonomy (supported: "bestsum", "bestsumorder") [default: bestsum]
#        -r, --rank <TAXRANK>...     Taxonomic rank(s) at which output will be written. (supported: 'species', 'genus', 'family', 'order', 'phylum', 'superkingdom', 'all') $
#        -b, --hits                  Displays taxonomic hits from tax files that contributed to the taxonomy.
#        --concoct                   Generate concoct files [default: False]
#        --cov                       Generate cov files [default: False]
#        --experimental              Experimental output [default: False]
#        -n, --notable               Do not generate table view [default: False]
