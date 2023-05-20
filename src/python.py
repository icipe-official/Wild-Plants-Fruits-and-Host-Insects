
from ete3 import Tree, TreeStyle, NodeStyle
import psycopg2
# trial with output file
# working
from Bio import SeqIO
from io import StringIO
from tempfile import NamedTemporaryFile
from ete3 import PhyloTree
from Bio.Align.Applications import MafftCommandline
import subprocess
import os
import shutil
import sys


def align_sequences(sequences):
    # connect to the database
    # try:
    #     conn = psycopg2.connect(
    #         database="khnc_final",
    #         user="boni",
    #         password="boni",
    #         host="localhost",
    #         port="5432"
    #     )
    #     print(conn)
    #     # Create a cursor object to interact with the database
    #     cur = conn.cursor()
    #     print(cur)

    #     # Select the sequences from the table based on a region filter
    #     region = "Africa"  # replace with your region of interest
    #     print(region)
    #     cur.execute(f"SELECT plants.species_name, plants.rbcl FROM plants  JOIN plants_regions ON plants.id=plants_regions.plants_id JOIN regions ON plants_regions.region_id=regions.id  WHERE regions.region LIKE '%Eastern%' AND plants.rbcl IS NOT NULL")

    #     # "SELECT plants., plants.rbcl, regions.region_name FROM plants JOIN plants_regions ON plants.region_id = regions.id")

    #     # Iterate over the results and print each row to stdout
    #     for row in cur.fetchall():
    #         print(row)
    # except Exception as e:
    #     print("Unable to connect to the database:", e)
    # Use mafft to  1align the sequences
    mafft_cline = MafftCommandline(input="-", auto=True)
    seq_data = '\n'.join(['>' + k + '\n' + v for k, v in sequences.items()])
    print(mafft_cline)
    stdout, stderr = mafft_cline(stdin=seq_data)
    # print(seq_data)
    # print(seq_data)
    # Parse the aligned sequences from the standard output
    aligned_seqs = {}
    with StringIO(stdout) as output:
        for record in SeqIO.parse(output, "fasta"):
            aligned_seqs[record.id] = str(record.seq)
    # print(aligned_seqs)

    # Construct the tree using ETE toolkit and IQ-TREE
    t = PhyloTree()
    for name, seq in aligned_seqs.items():
        node = t.add_child()
        node.sequence = seq
        node.name = name
        node.dist = 0
        # print(t)
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
    shutil.move(f"{temp_file.name}.treefile",
                "biogeography/temp_alignment.treefile")
    shutil.move(f"{temp_file.name}.log", "biogeography/iqtree2.log")
    shutil.move(f"{temp_file.name}.mldist", "biogeography/iqtree2.mldist")

    # ! iqtree2 --redo -s temp_alignment.fasta -te temp_alignment.treefile -nt AUTO


sequences = {'Abutilon hirtum': 'AAGTGTTGGATTCAAAGCCGGTGTTAAAGATTATAAATTGACTTATTACACTCCTGACTATGAAACCAAAGATACTGATATCTTGGCAGCGTTTCGAGTAACTCCTCAACCTGGAGTTCCGCCTGAGGAAGCAGGGGCCGCGGTAGCTGCTGAATCTTCTACTGGTACATGGACAACTGTATGGACTGACGGGCTTACCAGTCTTGATCGTTACAAAGGTCGATGCTACGGCCTTGAGCCCGTTGCTGGAGAAGAAAATCAATATATTGCTTATGTAGCTTACCCCTTAGACCTTTTTGAAGAAGGTTCTGTTACTAACATGTTTACTTCCATTGTGGGTAATGTTTTTGGGTTCAAGGCCCTGCGCGCTCTACGTTTGGAGGATTTGCGAATCCCTACTGCTTATACTAAAACTTTCCAAGGACCGCCTCATGGCATCCAGGTTGAAAGAGATAAATTGAACAAGTATGGCCGCCCCCTATTGGGATGTACTATTAAACCTAAATTGGGGTTATCTGCTAAGAATTACGGTAGAGCAGTTTATGAATGTCTT', 'seq2': 'AGGGAAAGGGGGCCCGGTCGTTTT',
             'seq3': 'ATTTTTTTTTTGGGGGCGTAATTGGGGGTTC', 'seq4': 'ATTTTTTTTTTGGGGGCGTAATTGGGGGTTC'}

# print(sequences)
print(sequences)

align_sequences(sequences)

# # Load the tree from a Newick file
# t = Tree("../phylogenetics/temp_alignment.fasta.treefile")
# print(t)

# Define the style for the nodes
# ns = NodeStyle()
# ns["size"] = 0
# # Create a TreeStyle object to customize the tree rendering
# ts = TreeStyle()
# ts.show_leaf_name = True
# ts.show_branch_support = True
# ts.layout_fn = lambda x: x.layout()
# ts.mode = "c"

# # Apply the style to the nodes
# for n in t.traverse():
#     print(n)
#     n.set_style(ns)

# # Get the current working directory and create the output path
# cwd = os.getcwd()
# output_path = os.path.join(cwd, "mytree.png")

# # Render the tree to a file
# t.render('../mytree.png', tree_style=ts)

# # Print the output path to confirm that the file was saved
# print(f"Output saved to: {output_path}")

# connect to the databse

# Connect to the PostgreSQL database
# region = "Sudana"
# print(region)
# conn = psycopg2.connect(
#     database="mydatabase",
#     user="myuser",
#     password="mypassword",
#     host="localhost",
#     port="5432"
# )
# print(conn)
# # Create a cursor object to interact with the database
# cur = conn.cursor()

# # Select the sequences from the table based on a region filter
# region = "Africa"  # replace with your region of interest
# print(region)
# cur.execute(f"SELECT id, sequence FROM mytable WHERE region='{region}'")
# # Iterate over the results and print each row to stdout
# for row in cur.fetchall():
#     print(row)
# print('llllllllllllllllllll')
# # Make sure to flush the output buffer to ensure that all data is sent to the parent process
# sys.stdout.flush()

# # Close the cursor and connection
# cur.close()
# conn.close()
# # Retrieve the sequence data
# sequences = {}
# for seq_id, seq_data in cur.fetchall():
#     sequences[seq_id] = seq_data

# # Close the cursor and database connection
# cur.close()
# conn.close()

# Load the tree from a Newick file

# Load the tree from a Newick file
# t = Tree("mytree.nwk")

# # Define the style for the nodes
# ns = NodeStyle()
# ns["size"] = 0

# Create a TreeStyle object to customize the tree rendering
