import { useState, useEffect } from 'react';
import { useRouter } from 'next/router';
import Box from '@mui/material/Box';
import { Container,ButtonBase } from '@mui/material';
import Link from 'next/link';
export default function QueryResult({query_data}) {
  const [selectedIndex, setSelectedIndex] = useState(-1);

  const handleItemClick = (index) => {
    setSelectedIndex(index);
  };

  return (
    <Box>
   <Box>
  <Box sx={{marginTop:'1rem'}}>{query_data.length} Species returned based on your search query</Box>
  <Box sx={{height: '8rem', overflowY: 'scroll', width: '500px', border: '1px solid #ccc'}}>
  {query_data.map((dat, index) => (
      <Box
       key={dat.id}
       sx={{
         backgroundColor: index === 0 && selectedIndex !== 0 ? 'inherit' : selectedIndex === index ? 'gray' : 'inherit',
         color: selectedIndex === index ? 'white' : 'black',
       }}
       onClick={() => handleItemClick(index)}
     >
 
      <Link href={`/plants/${dat.species_name}`} style={{ textDecoration:'none',color:"black"}}>
        {dat.plant_genera.genus_name} {dat.species_name}
      </Link>
    </ Box>
  ))}
</Box>
</Box>
</Box>
  );
}
