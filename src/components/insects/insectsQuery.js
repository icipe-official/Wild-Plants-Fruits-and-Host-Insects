// import { useState, useEffect } from 'react';
// import { useRouter } from 'next/router';
import Box from '@mui/material/Box';
import { useState } from 'react';
import Link from 'next/link';

// import { Container,ButtonBase } from '@mui/material';
// import Link from 'next/link';
export default function InsectQuery({insect_data,selected_species}) {
  const [selectedIndexPlant, setSelectedIndexPlant] = useState(0);
  const [selected, setSelectedItem] = useState(null);
  const [selectedIndex, setSelectedIndex] = useState(0);

console.log(insect_data)

console.log("selected_species client side")

console.log(selected_species)

//obtain  plants from which insect was reared
//resul is a nested array
const fruits_reared=insect_data.map(insect=>insect.plants_insects)

//loop through each array to obtain genus and species name
const speciesAndGenus = fruits_reared.map((nestedArray) => {
    return nestedArray.map((obj) => {
      return {
        species_name: obj.plants.species_name,
        genus_name: obj.plants.plant_genera.genus_name
      };
    });
  });
// convert the nested array to a singler array of values
const singleList = speciesAndGenus.reduce((acc, val) => acc.concat(val), []);

console.log("speciesAndGenus")
console.log(speciesAndGenus)
console.log("fruits_reared")  
console.log(fruits_reared)  
console.log("singleList")  
console.log(singleList)  
// handle item click
// const newUrl = `/insects/query?genus=${specie.insect_genera.genus_name}$selected_species=${specie.species_name}`;

  const handleItemClick = (index) => {
    setSelectedIndex(index);
  };

  return (
    <Box>
      <Box sx={{ marginTop: '1rem', fontWeight: 'bold' }}>
        {insect_data.length} Insect Species
      </Box>
      <Box
        sx={{
          height: '8rem',
          overflowY: 'scroll',
          width: '500px',
          border: '1px solid #ccc',
        }}
      > {insect_data.map((specie, index) => (
          <Box
            key={specie.id}
            sx={{
              backgroundColor:
                index === 0 && selectedIndex !== 0
                  ? 'inherit'
                  : selectedIndex === index
                  ? 'gray'
                  : 'inherit',
              color: selectedIndex === index ? 'white' : 'black',
            }}
            onClick={() => handleItemClick(index)}>
            <Link
              href={`/insects/query?genus=${specie.insect_genera.genus_name}&species_name=${specie.species_name}`}
              style={{ textDecoration: 'none', color: 'black' }}
            >
              {specie.insect_genera.genus_name} {specie.species_name}
            </Link>
          </Box>
          )
          )
          }
      </Box>
    </Box>
  );
};

