// // import { spawn } from 'child_process';

// // export default async function handler(req, res) {
// //   const { data } = req.body;

// //   const mafft = spawn('mafft', ['--auto', '--reorder', '-'], { shell: true });

// //   mafft.stdin.write(data);
// //   mafft.stdin.end();

// //   let newick = '';

// //   mafft.stdout.on('data', (data) => {
// //     newick += data.toString();
// //   });

// //   mafft.stderr.on('data', (data) => {
// //     console.error(`stderr: ${data}`);
// //   });}

// //   mafft.on('close', (code) => {
// //     if (code === 0) {
// //       res.status(200).json({ newick });
// //     } else {
// //       res.status(500).json({ message: 'MAFFT failed' });
// //     }
// //   });
// // }

// //pages/api

const {spawn} = require('child_process');

export default async function handler(req, res) {
    let python = spawn('python', ['./src/python.py']);
    let dataToSend = '';

    for await (const data of python.stdout){
      //console.log(data.toString());
      dataToSend += data.toString()
    }
  return res.status(200).json({ message: dataToSend})
}



// const { spawn } = require('child_process');

// const sequences = {
//     'seq1': 'ATCG',
//     'seq2': 'AGTC',
//     'seq3': 'ATTC'
// };

// // const python = spawn('python', ['align_sequences.py']);
// const python = spawn('python', ['./src/python.py']);

// let output = '';
// python.stdout.on('data', (data) => {
//   output += data.toString();
// });

// python.on('close', (code) => {
//   if (code !== 0) {
//     console.error(`Python script exited with code ${code}`);
//   } else {
//     console.log(`Newick format output: ${output}`);
//   }
// });

// python.stdin.write(JSON.stringify(sequences));
// python.stdin.end();

// }

// import { useState } from 'react';

// export default function AlignSequencesForm() {
//   const [sequences, setSequences] = useState('');
//   const [newick, setNewick] = useState('');

//   const handleAlignSequences = async () => {
//     const response = await fetch('/api/align_sequences', {
//       method: 'POST',
//       headers: { 'Content-Type': 'application/json' },
//       body: JSON.stringify({ sequences })
//     });
//     const newick = await response.json();
//     setNewick(newick);
//   };

//   const handleSequencesChange = (event) => {
//     setSequences(event.target.value);
//   };

//   return (
//     <div>
//       <textarea value={sequences} onChange={handleSequencesChange} />
//       <button onClick={handleAlignSequences}>Align Sequences</button>
//       {newick && (
//         <pre>
//           {newick}
//         </pre>
//       )}
//     </div>
//   );
// }
// import { spawn } from 'child_process';

// export default async function handler(req, res) {
//   if (req.method !== 'POST') {
//     res.status(405).json({ message: 'Method not allowed' });
//     return;
//   }

//   const { sequences } = req.body;
// // const python = spawn('python', ['./src/python.py']);
//   const pythonProcess = spawn('python', ['./src/python.py']);

//   // Send sequences to Python script
//   pythonProcess.stdin.write(sequences);
//   pythonProcess.stdin.end();

//   // Collect output from Python script
//   let newick = '';
//   pythonProcess.stdout.on('data', (data) => {
//     newick += data;
//   });

//   pythonProcess.on('close', (code) => {
//     if (code !== 0) {
//       res.status(500).json({ message: `Alignment failed with code ${code}` });
//     } else {
//       res.status(200).json({ newick });
//     }
//   });
// }

