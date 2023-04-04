//This functional component implements a cascading drop down for plant Family-Genus-Species
//Import required libraries
// define state variables
//By default, family drop down shows the families available for user to select
// Selecting family calls the api for genus for the selected family 
// and clears any available data of genus and species from previous search
// Selecting genus calls an api for fetching species data which are filterd based on the selected genus
import { useState } from "react";
import { useEffect } from "react";
import Select from "react-select";
export default function  Searchbar() {
    const [familyId,setFamilyId]=useState('')
    const [genusId,setGenusId]=useState('')
    const [speciesId,setSpeciesId]=useState('')
    const [familyData,setfamilyData]=useState([])
    const [genusData,setGenusData]=useState([])
    const [speciesData,setSpeciesData]=useState([])
    const [loaded,setLoaded]=useState(false)
    const [error,setError]=useState(null)
    useEffect(() => {
        // fetch api
                fetch(
                    '/api/family'
                )
                    .then((res) => res.json())
                    .then(
                        (result) => {
                            setLoaded(true);
                            setfamilyData(result);
                        },
                        (error) => {
                            setLoaded(true);
                            setError(error);
                        }
                    );
            }, []);
//   console.log(familyData)
//   console.log('family')
// useEffect(() => {
//     countriesData(CountryData)})
console.log('CountryData')
console.log(familyData)
    const OnFamilyChange = (e) => {
        fetch(
            '/api/genus'
        )
            .then((res) => res.json())
            .then(
                (result) => {
                    const filteredgenus= result.filter((genus) => {
                    return genus.family_name == e.value});
                    setLoaded(true);
                    setGenusData(filteredgenus)
                    
                },
                (error) => {
                    setLoaded(true);
                    setError(error);
                }
            );
        setFamilyId(e.value)
        setGenusId("")
        setSpeciesId( "")
        setSpeciesData([])
    };
    console.log('statedsta')
    console.log(genusData)


    const OnGenusChange = (e) => {
            // fetch api
                    fetch(
                        '/api/plantSpecies'
                    )
                        .then((res) => res.json())
                        .then(
                            (result) => {
                                const filteredspecies= result.filter((specie) => {
                                return specie.family_name == familyId &&
                                specie.genus_name == e.value});
                                setLoaded(true);
                                setSpeciesData(filteredspecies)
                                
                            },
                            (error) => {
                                setLoaded(true);
                                setError(error);
                            }
                        );

        setGenusId(e.value)
        setSpeciesId("")
        

    };
  
    const OnSpeciesChange = (e) => {
        setSpeciesId(e.value)
    };

      return (
        <div className="container">
          <span>Family:</span>

            <Select 
             defaultValue={familyId}
              options={familyData.sort().map((family) => ({value:family.family_name,label:family.family_name}))}
              onChange={OnFamilyChange}
             //isMulti
               //isClearable
        />
     <span>Genus:</span>
        <Select 
                 defaultValue={genusId}
                 options={genusData.sort().map((genus) => ({value:genus.genus_name,label:genus.genus_name}))}
                 onChange={OnGenusChange}
        //isMulti
      // isClearable
        />
     <span>Specie:</span>
        <Select 
          defaultValue={speciesId}
          options={speciesData.sort().map((specie) => ({value:specie.genus_name,label:specie.species_name}))}
          onChange={OnSpeciesChange}
        //isMulti
      // isClearable
        />     
  </div>
      );
    }