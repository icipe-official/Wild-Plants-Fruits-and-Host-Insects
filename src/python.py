import os
import tempfile
from Bio.Align.Applications import MafftCommandline
import subprocess
from io import StringIO
from Bio import SeqIO
import shutil
import sys

def construct_phylogenetic_tree(sequences):
    if not sequences:
        return ""
    # Use MAFFT to align the sequences
    mafft_cline = MafftCommandline(input="-", auto=True)
    stdout, stderr = mafft_cline(stdin=sequences)

    # Parse the aligned sequences from the standard output
    aligned_seqs = {}
    with StringIO(stdout) as output:
        for record in SeqIO.parse(output, "fasta"):
            aligned_seqs[record.id] = str(record.seq)

    # Create a temporary file to store the aligned sequences
    temp_dir = tempfile.mkdtemp()
    temp_file_path = os.path.join(temp_dir, "temp_alignment.fasta")

    # Write the aligned sequences to the temporary file
    with open(temp_file_path, "w") as f:
        for seq_id, sequence in aligned_seqs.items():
            f.write(f">{seq_id}\n{sequence}\n")

    # Run IQ-TREE to construct the phylogenetic tree
    iqtree_command = f"iqtree2 -s {temp_file_path}"
    
    # subprocess.run(iqtree_command, shell=True)
    # supress standard output
    subprocess.run(iqtree_command, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    # Retrieve the path of the tree file
    tree_file_path = f"{temp_file_path}.treefile"

    # Read the tree file and extract the Newick tree
    with open(tree_file_path, "r") as f:
        lines = f.readlines()
        newick = lines[-1].strip()

    # Delete the temporary directory and its contents
    shutil.rmtree(temp_dir)
    return newick

# Read the sequences from the standard input
sequences = sys.stdin.read()

# Construct the phylogenetic tree
newick = construct_phylogenetic_tree(sequences)
newick
# Print the Newick tree to the standard output
print(newick)
