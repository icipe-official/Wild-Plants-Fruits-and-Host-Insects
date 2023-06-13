import { spawn } from 'child_process';
import fs from 'fs';
import path from 'path';
import os from 'os';

export default async function handler(req, res) {
  const { sequences } = req.body; // Assuming sequences are sent in the request body
  console.log(sequences);
  // const sequences = {
  //   "Abutilon hirtum":
  //     "AAGTGTTGGATTCAAAGCCGGTGTTAAAGATTATAAATTGACTTATTACACTCCTGACTATGAAACCAAAGATACTGATATCTTGGCAGCGTTTCGAGTAACTCCTCAACCTGGAGTTCCGCCTGAGGAAGCAGGGGCCGCGGTAGCTGCTGAATCTTCTACTGGTACATGGACAACTGTATGGACTGACGGGCTTACCAGTCTTGATCGTTACAAAGGTCGATGCTACGGCCTTGAGCCCGTTGCTGGAGAAGAAAATCAATATATTGCTTATGTAGCTTACCCCTTAGACCTTTTTGAAGAAGGTTCTGTTACTAACATGTTTACTTCCATTGTGGGTAATGTTTTTGGGTTCAAGGCCCTGCGCGCTCTACGTTTGGAGGATTTGCGAATCCCTACTGCTTATACTAAAACTTTCCAAGGACCGCCTCATGGCATCCAGGTTGAAAGAGATAAATTGAACAAGTATGGCCGCCCCCTATTGGGATGTACTATTAAACCTAAATTGGGGTTATCTGCTAAGAATTACGGTAGAGCAGTTTATGAATGTCTT",
  //   seq2: "AGGGAAAGGGGGCCCGGTCGTTTT",
  //   seq3: "ATTTTTTTTTTGGGGGCGTAATTGGGGGTTC",
  //   seq4: "ATTTTTTTTTTGGGGGCGTAATTGGGGGTTC",
  // };

  // Convert sequences to FASTA format
  let fasta = '';
  Object.entries(sequences).forEach(([name, sequence]) => {
    fasta += `>${name}\n${sequence}\n`;
  });

  const pythonScriptPath = 'src/python.py';
  const pythonProcess = spawn('python3', [pythonScriptPath]);

  let newick = '';
  let errorOutput = '';

  pythonProcess.stdout.on('data', (data) => {
    newick += data;
  });

  pythonProcess.stderr.on('data', (data) => {
    errorOutput += data;
  });

  pythonProcess.on('close', (code) => {
    if (code !== 0) {
      res.status(500).json({
        message: `Alignment failed with code ${code}`,
        error: errorOutput,
      });
    } else {
      res.status(200).json({ newick });
    }
  });

  pythonProcess.stdin.write(fasta);
  pythonProcess.stdin.end();
}
