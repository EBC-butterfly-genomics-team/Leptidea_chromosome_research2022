#!/usr/bin/env python
#
# Lars Höök, 2021 - lars.hook@ebc.uu.se
#
# Script to partition BlobTools view output table
# Run: python partition_blobtools_view_table.py <blobtools_view_table.txt> [-options]
#
# Each filtering step is optional and is applied in the following order:
#   1. Subset scaffolds (include/exclude)
#   2. Filter on taxa
#   3. Filter on GC and coverage
#   4. Filter on GC
#   5. Filter on coverage
#   6. Filter on scaffolds length
#
# Description:
#
#   1. Subset scaffold - file with list of scaffold id's to include in (or exclude from) filtering.
#      Can be used to filter on subset of data based on additional evidence.
#      NOTE: scaffolds excluded by this step are NOT included in the output.
#      Excluded scaffolds can be filtered in a separate run using the switch (--exclude)
#      and both outputs can then be merged manually (cat <run1.out> <run2.out> > <both_runs.out> SORT order??? ).
#
#   2. Filter on taxa - input file with a list of taxa to remove.
#      (One taxa per row?) Names must be identical to blast result.
#
#   3. Filter on a combination of GC% and coverage. Removes scaffolds with GC% < mean GC% - N
#      or > mean GC% + N that also have a coverage lower than a given % of mean coverage.
#      NOTE: GC% and coverage thresholds are calculated differently. GC% threshold is set by an absolute value that
#      gets added/removed to mean GC%. Example: mean GC% = 40, N = 10 => lower threshold = 30 and upper threshold = 50
#      The coverage threshold is set as a % of mean coverage to account for non-biological variance in sequencing depth.
#      Example: mean coverage = 50X, % = 10 => threshold = 5X
#
#   4. Filter on GC% - similar to 3. but ignores coverage.
#
#   5. Filter on coverage - similar to 3. but ignores GC%.
#
#   6. Filter on scaffold sequence length - scaffolds shorter than set bp threshold will be removed.
#
# Options:
#
# -o/--output <string>          Output file name (default=<infile>-filtered.txt)
# -s/--scaffolds <file>         File with list of scaffolds to include in filtering
# -e/--exclude                  Changes behaviour of --scaffolds from include to exclude
# -t/--taxa <file>              File with list of taxa to remove
# -gc/--gc [FLOAT]              Define assembly mean GC%
# -c/--coverage [FLOAT]         Define assembly mean coverage
# -fxy/--xy_filter              Filter on combination of GC% and coverage
# -x/--xy_gc [FLOAT]            GC% threshold for --xy_filter, remove beyond (+/-) N of mean set with --gc
# -y/--xy_coverage [FLOAT]      Coverage threshold for --xy_filter, remove below N% of mean set with --coverage
# -fgc/--gc_filter [FLOAT]      Filter on GC% only, remove beyond (+/-) N of mean set with --gc
# -fcov/--cov_filter [FLOAT]    Filter on coverage only, remove below % of mean coverage set with --coverage
# -l/--length [INT]             Scaffolds shorter than set threshold will be removed.
#
# TODO:
# -GC filters requires --gc etc.
# -Make taxa input non-case sensitive
# -Errors

import sys
import os
import argparse
from typing import Any, Union
import pandas as pd
from pandas import Series, DataFrame
from pandas.io.parsers import TextFileReader
import datetime

parser=argparse.ArgumentParser()
parser.add_argument('files', nargs='*')
parser.add_argument("-o", "--output", help="Output file name (default=<infile>-filtered.txt)", type=str)
parser.add_argument("-s", "--scaffolds", help="File with list of scaffolds to keep", type=argparse.FileType('r'))
parser.add_argument("-e", "--exclude", help="Changes behaviour of --scaffolds from include to exclude", action="store_true")
parser.add_argument("-t", "--taxa", help="File with list of taxa to remove", type=argparse.FileType('r'))
parser.add_argument("-gc,", "--gc", help="Define assembly mean GC%", type=float)
parser.add_argument("-c", "--coverage", help="Define assembly mean coverage", type=float)
parser.add_argument("-fxy", "--xy_filter", help="Filter on combination of gc% and coverage", action="store_true")
parser.add_argument("-x", "--xy_gc", help="GC% threshold for --xy_filter, remove beyond (+/-) -x of mean set with parameter -gc", type=float)
parser.add_argument("-y", "--xy_coverage", help="Coverage threshold for --xy_filter, remove below % of mean coverage set with -c", type=float)
parser.add_argument("-fgc", "--gc_filter", help="Filter on GC% only, remove beyond (+/-) -gcf of mean set with parameter -gc", type=float)
parser.add_argument("-fcov", "--cov_filter", help="Filter on coverage only, remove below % of mean coverage set with -c", type=float)
parser.add_argument("-l", "--length", help="Scaffolds shorter than set threshold will be removed", type=int)
args = parser.parse_args()

cent = 100
view_table = sys.argv[1]
df = pd.read_table(view_table, comment='#', header=None)
total_scaffold = len(df.index)
total_seq = df.iloc[:,1].sum()

if args.output:
    out_prefix = args.output
else:
    out_prefix = os.path.splitext(sys.argv[1])[0]

sys.stdout = open(out_prefix+".log", "w")

print("\nLog for partitioning BlobTools view table -",
      datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),"\n")
print("Filtering with following settings:\n")

if args.gc:
    show_gc = args.gc
    print("\t- User defined mean GC%:",
         str(show_gc)+"%\n")

if args.coverage:
    show_cov = args.coverage
    print("\t- User defined mean coverage:",
          str(show_cov)+"X\n")

if args.exclude:
    print("\t- Using subset of data, excluding scaffolds in list...\n")
elif args.scaffolds:
    print("\t- Using subset of data, including scaffolds in list...\n")

if args.taxa:
    print("\t- Removing scaffolds based on taxa present in list...\n")

if args.xy_filter:
    show_xy_cov = args.xy_coverage
    print("\t- Filtering on combination of GC% and coverage:")
    print("\t  Removing scaffolds with ",
          f"{args.gc - args.xy_gc:.2f}",
          "> GC% >",
          f"{args.gc + args.xy_gc:.2f}",
          "& coverage <",
          str(show_xy_cov)+"% of mean X\n")

if args.gc_filter:
    print("\t- Removing scaffolds with ",
          f"{args.gc - args.gc_filter:.2f}",
          "> GC% >",
          f"{args.gc + args.gc_filter:.2f}\n")

if args.cov_filter:
    show_y_cov = args.cov_filter
    print("\t- Removing scaffolds with coverage <",
          str(show_y_cov)+"% of mean X\n")

if args.length:
    print("\t- Removing scaffolds <",
          f"{args.length:,}", "bp","\n")
    
print("\n. o O ( Results ) O o .\n")
print("Total scaffolds:", f"{total_scaffold:,}")
print("Total seq:", f"{total_seq:,}", "bp","\n")

if args.exclude:
    with args.scaffolds as scaffolds:
        scaffolds = scaffolds.read().splitlines()
        df = df[~df.iloc[:,0].isin(scaffolds)]
        processed_scaffold = len(df.index)
        processed_seq = df.iloc[:, 1].sum()
        print("Processed scaffolds:",
              f"{processed_scaffold:,}")
        print("Processed seq:",
              f"{processed_seq:,}", "bp", "\n")
elif args.scaffolds:
    with args.scaffolds as scaffolds:
        scaffolds = scaffolds.read().splitlines()
        df = df[df.iloc[:,0].isin(scaffolds)]
        processed_scaffold = len(df.index)
        processed_seq = df.iloc[:, 1].sum()
        print("Processed scaffolds:",
              f"{processed_scaffold:,}")
        print("Processed seq:",
              f"{processed_seq:,}", "bp", "\n")

if args.taxa:
    with args.taxa as taxa:
        in_taxa_scaffold = len(df.index)
        in_taxa_seq = df.iloc[:, 1].sum()

        taxa = taxa.read().splitlines()
        df = df[~df.iloc[:, 5].isin(taxa)]

        out_taxa_scaffold = len(df.index)
        out_taxa_seq = df.iloc[:, 1].sum()
        removed_taxa_scaffolds = in_taxa_scaffold - out_taxa_scaffold
        removed_taxa_seq = in_taxa_seq - out_taxa_seq

        print("Removed scaffolds based on taxa:",
              f"{removed_taxa_scaffolds:,}")
        print("Removed seq based on taxa:",
              f"{removed_taxa_seq:,}", "bp", "\n")

if args.xy_filter:
    in_xy_scaffolds = len(df.index)
    in_xy_seq = df.iloc[:, 1].sum()

    df.drop(df[(df.iloc[:, 2] > args.gc / cent + args.xy_gc / cent) &
        (df.iloc[:, 4] < args.xy_coverage / cent * args.coverage)].index, inplace=True)
    df.drop(df[(df.iloc[:, 2] < args.gc / cent - args.xy_gc / cent) &
        (df.iloc[:, 4] < args.xy_coverage / cent * args.coverage)].index, inplace=True)

    out_xy_scaffolds = len(df.index)
    out_xy_seq = df.iloc[:, 1].sum()
    removed_xy_scaffolds = in_xy_scaffolds - out_xy_scaffolds
    removed_xy_seq = in_xy_seq - out_xy_seq

    print("Removed scaffolds based on GC% and coverage filter:",
          f"{removed_xy_scaffolds:,}")
    print("Removed seq based on GC% and coverage filter:",
          f"{removed_xy_seq:,}", "bp", "\n")

if args.gc_filter:
    in_gc_scaffolds = len(df.index)
    in_gc_seq = df.iloc[:, 1].sum()

    df = df[(df.iloc[:, 2] < args.gc / cent + args.gc_filter / cent) &
            (df.iloc[:, 2] > args.gc / cent - args.gc_filter / cent)]

    out_gc_scaffolds = len(df.index)
    out_gc_seq = df.iloc[:, 1].sum()
    removed_gc_scaffolds = in_gc_scaffolds - out_gc_scaffolds
    removed_gc_seq = in_gc_seq - out_gc_seq

    print("Removed scaffolds based on GC% filter:",
          f"{removed_gc_scaffolds:,}")
    print("Removed seq based on GC% filter:",
          f"{removed_gc_seq:,}", "bp", "\n")

if args.cov_filter:
    in_cov_scaffolds = len(df.index)
    in_cov_seq = df.iloc[:, 1].sum()

    df = df[df.iloc[:,4] > args.cov_filter / cent * args.coverage]

    out_cov_scaffolds = len(df.index)
    out_cov_seq = df.iloc[:, 1].sum()
    removed_cov_scaffolds = in_cov_scaffolds - out_cov_scaffolds
    removed_cov_seq = in_cov_seq - out_cov_seq

    print("Removed scaffolds based on coverage filter:",
          f"{removed_cov_scaffolds:,}")
    print("Removed seq based on coverage filter:",
          f"{removed_cov_seq:,}", "bp", "\n")

if args.length:
    in_length_scaffolds = len(df.index)
    in_length_seq = df.iloc[:, 1].sum()

    df = df[df.iloc[:, 1] > args.length]

    out_length_scaffolds = len(df.index)
    out_length_seq = df.iloc[:, 1].sum()
    removed_length_scaffolds = in_length_scaffolds - out_length_scaffolds
    removed_length_seq = in_length_seq - out_length_seq

    print("Removed scaffolds based on length:",
          f"{removed_length_scaffolds:,}")
    print("Removed seq based on length:",
          f"{removed_length_seq:,}", "bp", "\n")

    
kept_scaffolds = len(df.index)
kept_seq = df.iloc[:, 1].sum()
removed_scaffolds = processed_scaffold - kept_scaffolds
removed_seq = processed_seq - kept_seq

print("Summary:", "\n")
print("Scaffolds remaining:",
      f"{kept_scaffolds:,}")
print("Scaffolds removed:",
      f"{removed_scaffolds:,}")
print("% of processed scaffolds removed:",
      f"{removed_scaffolds / processed_scaffold * cent:.2f}"+"%")
print("% of total scaffolds removed:",
      f"{removed_scaffolds / total_scaffold * cent:.2f}"+"%", "\n")

print("Seq remaining:",
      f"{kept_seq:,}", "bp")
print("Seq removed:",
      f"{processed_seq - kept_seq:,}", "bp")
print("% of processed seq removed:",
      f"{removed_seq / processed_seq * cent:.2f}"+"%")
print("% of total seq removed:",
      f"{removed_seq / total_seq * cent:.2f}"+"%", "\n")

#df_final = df.iloc[:,0].to_csv(index=False, sep='\t', header=False)
df_final = df.to_csv(index=False, sep='\t', header=False)

if args.output:
    with open (args.output+"-filtered.txt", 'w', newline='') as file:
        file.write(df_final)
    print("Output written to:",
          args.output+"-filtered.txt")
else:
    with open (out_prefix+"-filtered.txt", 'w', newline='') as file:
        file.write(df_final)
    print("Output written to:",
          out_prefix+"-filtered.txt")
