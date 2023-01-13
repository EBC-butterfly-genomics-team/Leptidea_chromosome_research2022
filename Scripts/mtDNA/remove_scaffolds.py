#!/usr/bin/env python
#
# modified from biopython tutorial and cookbook
#
# Remove entries from multifasta based on list
# Run: ./remove_scaffolds.py <fasta_file.fasta> <list_file> <out_file>

from Bio import SeqIO
import sys

fasta_file = sys.argv[1]
list_file = sys.argv[2]
filtered_file = sys.argv[3]

with open(list_file) as id_handle:
    wanted = set(line.rstrip("\n").split(None, 1)[0] for line in id_handle)
print("Found %i unique identifiers in %s" % (len(wanted), list_file))

records = (r for r in SeqIO.parse(fasta_file, "fasta") if not r.id in wanted)
count = SeqIO.write(records, filtered_file, "fasta")
print("Saved %i records from %s to %s" % (count, fasta_file, filtered_file))
if count < len(wanted):
    print("Warning %i IDs not found in %s" % (len(wanted) - count, fasta_file))
