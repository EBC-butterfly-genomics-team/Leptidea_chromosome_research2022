import sys
import pandas as pd
from Bio import SeqIO

fasta_file = sys.argv[1]
bed_file = sys.argv[2]

# store input fasta name

# read BED-file and get position of trnM(atg).
BED_file = pd.read_csv(bed_file, sep='\t', header=None)
BED_file.columns = ["ID", "Start", "End", "Gene", "P-val", "Strand"]
N_to_move = (BED_file.loc[BED_file['Gene'] == "trnM(atg)", 'Start'].iloc[0]) - 1
#print(N_to_move)

# Store fasta header and sequence as separate objects
for seq_record in SeqIO.parse(fasta_file, "fasta"):
    HEADER = seq_record.id
    SEQUENCE = seq_record.seq

# Rearrange sequence to start with trnM(atg)
START_SEQUENCE = SEQUENCE[N_to_move:]
END_SEQUENCE = SEQUENCE[0:N_to_move]    # test :N_to_move

#print to new file
outputfile = fasta_file.split(".")[0]+"-rearranged.fasta"
with open(outputfile, 'w') as f:
    print('>', HEADER, sep='', file=f)
    print(START_SEQUENCE, END_SEQUENCE, sep='', file=f)
