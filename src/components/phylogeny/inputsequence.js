import { Box } from '@mui/material';
import { useState } from 'react';

export default function FastaToDict() {
  const [fastaInput, setFastaInput] = useState('');
  const [fastaArray, setFastaArray] = useState([]);

  const handleInputChange = (event) => {
    setFastaInput(event.target.value);
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    const fastaLines = fastaInput.trim().split('\n');
    let currentSequenceName = '';
    let currentSequence = '';
    const fastaArray = [];
    for (let line of fastaLines) {
      if (line.startsWith('>')) {
        if (currentSequenceName !== '') {
          fastaArray.push({
            name: currentSequenceName.slice(1),
            sequence: currentSequence
          });
          currentSequence = '';
        }
        currentSequenceName = line;
      } else {
        currentSequence += line.trim();
      }
    }
    fastaArray.push({
      name: currentSequenceName.slice(1),
      sequence: currentSequence
    });
    setFastaArray(fastaArray);
  };
console.log(fastaArray)
  return (
    <Box>
      <form onSubmit={handleSubmit}>
        <label>
          Enter FASTA sequence:
          <textarea value={fastaInput} onChange={handleInputChange} />
        </label>
        <button type="submit">Submit</button>
      </form>
    </Box>
  );
}
