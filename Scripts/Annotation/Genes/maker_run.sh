#!/bin/bash -l

#SBATCH -A snic2022-5-34
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 2-00:00:00
#SBATCH -J maker

module load bioinfo-tools
module load maker/3.01.04


species=SIN_Swe


#export AUGUSTUS_CONFIG_PATH=/home/larshook/LarsH/MAKER/"$species"/Augustus/augustus_config

maker \
       	maker_opts.ctl \
        maker_bopts.ctl \
        maker_exe.ctl \
        -fix_nucleotides

#Options:
#     -genome|g <file>    Overrides the genome file path in the control files
#     -datastore/         Forcably turn on/off MAKER's two deep directory
#      nodatastore        structure for output.  Always on by default.
#     -old_struct         Use the old directory styles (MAKER 2.26 and lower)
#     -tries|t <integer>  Run contigs up to the specified number of tries.
#     -cpus|c  <integer>  Tells how many cpus to use for BLAST analysis.
#                         Note: this is for BLAST and not for MPI!
#     -force|f            Forces MAKER to delete old files before running again.
#                         This will require all blast analyses to be rerun.
#     -again|a            recaculate all annotations and output files even if no
#                         settings have changed. Does not delete old analyses.
