import { exec } from 'child_process';
import fs from 'fs-extra';
import path from 'path';

export default async function handler(req, res) {
  const { sequences } = req.body; // Assuming sequences are sent in the request body
  console.log(sequences);

  try {
    // Create temporary directories for storing intermediate files
    const tempDir = path.join(process.cwd(), '.', 'temp');
    console.log(tempDir);
    await fs.ensureDir(tempDir);

    // Write sequences to a temporary file
    const inputFilePath = path.join(tempDir, 'input.fasta');
    await fs.writeFile(inputFilePath, sequences);

    // Run MAFFT and redirect the output to a file
    const outputFilePath = path.join(tempDir, 'output.fasta');
    const mafftCommand = `mafft ${inputFilePath} > ${outputFilePath}`;
    const mafftProcess = exec(mafftCommand);

    // Wait for the MAFFT process to finish
    await new Promise((resolve, reject) => {
      mafftProcess.on('close', (code) => {
        if (code === 0) {
          console.log('MAFFT process completed successfully');
          resolve();
        } else {
          console.error(`MAFFT process exited with code ${code}`);
          reject(new Error(`MAFFT process exited with code ${code}`));
        }
      });
    });

    // Read the output file and examine its structure
    const outputData = await fs.readFile(outputFilePath, 'utf-8');
    console.log(outputData);

    // Rest of your code...
  } catch (error) {
    console.error('Error:', error);
    res.status(500).send('An error occurred');
  }
}
