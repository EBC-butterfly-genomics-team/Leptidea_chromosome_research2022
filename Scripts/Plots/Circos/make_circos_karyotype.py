#!/usr/bin/env python

# Script to make karyotype table for circos plot from assembly fasta.
# Expects fasta file name in the format: PROJECT_SAMPLE*.fasta.
# Sample id is added to chromosome id to separate samples with similar scaffold names.
# Output format is:
# 'chr -' 'chromosome_id' 'label' 'start' 'end' 'color'

# Run: python make_circos_karyotype.py <infile.fasta> <outfile.txt> [-options]

# Options:
# -c/--color    add color scale 'col_N' (default='grey')
# -i/--invert   invert karyotype table (default=off)

# TODO: make color customizable

import sys
import argparse
from Bio import SeqIO
import pandas as pd
import re

parser=argparse.ArgumentParser()
parser.add_argument('files', nargs='*')
parser.add_argument("-c", "--color", help="add color scale 'col_N' (default=off/grey)", action="store_true")
parser.add_argument("-i", "--invert", help="invert karyotype table (ascending order)", action="store_true")
args=parser.parse_args()

fasta_file=sys.argv[1]
out_file=sys.argv[2]
sample_tag=re.split(pattern="[_|.|-]", string=fasta_file)[1]

#get scaffold lengths
with open(fasta_file):
   identifiers=[]
   lengths=[]
   for seq_record in SeqIO.parse(fasta_file, 'fasta'):
      identifiers.append(sample_tag+'_'+seq_record.id)
      lengths.append(len(seq_record.seq))

#convert lists to series
s1=pd.Series(identifiers, name='ID')
s2=pd.Series(lengths, name='end')

#make DataFrame
df=pd.DataFrame(dict(ID=s1, end=s2))
df.insert(0, 'chr', 'chr')
df.insert(1, '-', '-')
in_val=1
df.insert(3, 'chr_nr', range(in_val, len(df)+in_val))
df.insert(4, 'start', '0')

if args.color:
    df.insert(6, 'col', 'col_')
    df['col']=(df['col'] + (df.groupby('col').cumcount() + 1).astype(str))
else:
    df.insert(6, 'col', 'grey')

if args.invert:
    df.ID=df.ID.values[::-1]
    df.end=df.end.values[::-1]
    df.chr_nr=df.chr_nr.values[::-1]
    df.col=df.col.values[::-1]

df_final=df.to_csv(index=False, header=False, sep=' ')

with open(out_file, "w", newline='') as file:
   file.write(df_final)

#print(df_final)  #for testing
