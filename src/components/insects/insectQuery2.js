// import { useState, useEffect } from 'react';
// import { useRouter } from 'next/router';
import Box from '@mui/material/Box';
import { useState } from 'react';
import Link from 'next/link';
import { connect } from 'react-redux'

// import { Container,ButtonBase } from '@mui/material';
// import Link from 'next/link';
export default function InsectQuery2({insect_data,genus_list}) {
  const [selectedIndexPlant, setSelectedIndexPlant] = useState(0);
  const [selected, setSelectedItem] = useState(null);
  const [selectedIndex, setSelectedIndex] = useState(0);
  function mapStateToProps(state) {
    return { count: state.count }
  }
  
console.log(insect_data)

console.log("selected_species client side")

const fruits=insect_data.map(fruit=>fruit.plants_insects.map(specie=>specie.plants))[0] //[0] extract the first object 
console.log('fruits reatred Fruits functionsl component')
console.log(fruits)

console.log("fruits_reared")  
console.log(fruits)  
console.log("singleList")  

// console.log(singleList)  
// handle item click
// const newUrl = `/insects/query?genus=${specie.insect_genera.genus_name}$selected_species=${specie.species_name}`;
//regions collected
const regions=insect_data.map((specie, index) => (
specie.insects_regions.map(region=>region.regions.region+ ', ')))
  const handleItemClick = (index) => {
    setSelectedIndex(index);
  };
  console.log("regions")
  console.log(regions)

  return (
    <Box>
      <Box sx={{ marginTop: '1rem', fontWeight: 'bold' }}>
        {genus_list.length} Insect Species
      </Box>
      <Box
        sx={{
          height: '8rem',
          overflowY: 'scroll',
          width: '500px',
          border: '1px solid #ccc',
        }}
      > {genus_list.map((specie, index) => (
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
              href={`/insects/${specie.species_name}`}
              style={{ textDecoration: 'none', color: 'black' }}>
              {specie.insect_genera.genus_name} {specie.species_name}
            </Link>
          </Box>
          )
          )}
          
      </Box>
      
      <Box sx={{marginTop:'1rem',fontWeight:'bold'}}>Regions collected</Box>
       <Box sx={{height: '8rem', overflowY: 'scroll', width: '500px', border: '1px solid #ccc'}}>
        
       {insect_data.map((specie, index) => (
    specie.insects_regions.map(region=>region.regions.region+ ', ')))}

        <Box>
    </Box>
    </Box>
    </Box>
  );
};

