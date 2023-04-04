# trial with output file
#working
from Bio import SeqIO
from io import StringIO
from tempfile import NamedTemporaryFile
from ete3 import PhyloTree
from Bio.Align.Applications import MafftCommandline
import subprocess
import os
import shutil
def align_sequences(sequences):
    # Use mafft to  1align the sequences
    mafft_cline = MafftCommandline(input="-", auto=True)
    seq_data = '\n'.join(['>' + k + '\n' + v for k, v in sequences.items()])
    stdout, stderr = mafft_cline(stdin=seq_data)
    # print(seq_data)
    print(seq_data)
    # Parse the aligned sequences from the standard output
    aligned_seqs = {}
    with StringIO(stdout) as output:
        for record in SeqIO.parse(output, "fasta"):
            aligned_seqs[record.id] = str(record.seq)
    print(aligned_seqs)

    # Construct the tree using ETE toolkit and IQ-TREE
    t = PhyloTree()
    for name, seq in aligned_seqs.items():
        node = t.add_child()
        node.sequence = seq
        node.name = name
        node.dist = 0
        print(t)
  # Save the alignment as a temporary file
    temp_file = 'temp_alignment.fasta'
    with open(temp_file, 'w') as f:
        for name, seq in aligned_seqs.items():
            f.write(f'>{name}\n{seq}\n')
        t.link_to_alignment('./temp_alignment.fasta')
    t.write(format=9, outfile='temp_alignment.treefile')
    
        # Specify the output file path
    output_folder = os.path.join(os.getcwd(), '..', 'biogeography')
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)
    output_file = os.path.join(output_folder, 'temp_alignment.treefile')
     # Run IQ-TREE using subprocess
    iqtree_command = f'iqtree2 --redo -s {temp_file} -te temp_alignment.treefile -nt AUTO'
    subprocess.run(iqtree_command, shell=True)
    
     # Move the output files to the biogeography folder
    shutil.move(f"{temp_file.name}.treefile", "biogeography/temp_alignment.treefile")
    shutil.move(f"{temp_file.name}.log", "biogeography/iqtree2.log")
    shutil.move(f"{temp_file.name}.mldist", "biogeography/iqtree2.mldist")
    # ! iqtree2 --redo -s temp_alignment.fasta -te temp_alignment.treefile -nt AUTO
sequences = {'seq1': 'ATCGGGGGGGGGGGGGGTTTTTTGGGCCCGGGTTTGG','seq2': 'AGGGAAAGGGGGCCCGGTCGTTTT','seq3': 'ATTTTTTTTTTGGGGGCGTAATTGGGGGTTC','seq4':'ATTTTTTTTTTGGGGGCGTAATTGGGGGTTC'}
align_sequences(sequences)



# connect to the databse
import psycopg2

# Connect to the PostgreSQL database
conn = psycopg2.connect(
    database="mydatabase",
    user="myuser",
    password="mypassword",
    host="localhost",
    port="5432"
)

# Create a cursor object to interact with the database
cur = conn.cursor()

# Select the sequences from the table based on a region filter
region = "Africa"  # replace with your region of interest
cur.execute(f"SELECT id, sequence FROM mytable WHERE region='{region}'")

# Retrieve the sequence data
sequences = {}
for seq_id, seq_data in cur.fetchall():
    sequences[seq_id] = seq_data

# Close the cursor and database connection
cur.close()
conn.close()