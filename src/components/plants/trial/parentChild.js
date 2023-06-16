// import styles from './searchbar.module.css' // get access to styles for this componeny
import Select from "react-select";
import { useEffect } from "react";
import { useState } from "react";
//import Link from 'next/link';
// Note: the empty deps array [] means
// this useEffect will run once
export default function Searchbar() {
   // manage download of family_data
    const [familyData, setFamilyData] = useState([]); // manage sate of data loading from api
    //const [family, setFamily] = useState(""); //manage state for json data before and after loading
    //manage states for family data
    const [familyName,setFamilyName]=useState('')
    
    const [error, setError] = useState(null); //manag error statte
    const [loaded, setLoaded]=useState(false) //manage loaded or not
    // genus data
    const [genusData, setGenusData] = useState([]); // manage sate of data loading from api
    const [genusName, setGenusName] = useState(""); //manage state for json data before and after loading

    //plant species data
    const [speciesData, setSpeciesData] = useState([]); // manage sate of data loading from api
    const [speciesName, setSpeciesName] = useState(""); //manage state for json data before and after loading
   // set back the stattes after mouting
    
   const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;

    useEffect(() => {
// fetch api
        fetch(
            `${base_url}/api/family`
        )
            .then((res) => res.json())
            .then(
                (result) => {
                    setLoaded(true);
               setFamilyData(result);
                },
                (error) => {
                    setLoaded(true);
                    setError(error);
                }     
            );
    }, []);
    console.log(typeof familyData)
 

    useEffect(() => {
    // fetch api
            fetch(
                '/api/genus'
            )
                .then((res) => res.json())
                .then(
                    (result) => {
                        setLoaded(true);
                        setGenusData(result);
                    },
                    (error) => {
                        setLoaded(true);
                        setError(error);
                    }
                );
        }, []);

//species data

    useEffect(() => {
        // fetch api
                fetch(
                    '/api/plantSpecies'
                )
                    .then((res) => res.json())
                    .then(
                        (result) => {
                            setLoaded(true);
                    setSpeciesData(result);
                        },
                        (error) => {
                            setLoaded(true);
                            setError(error);
                        }     
                    );
            }, []);
                

    useEffect(() => {
        // setInterval(() => {
            setFamilyData(familyData);
            //setSpeciesData(speciesData);
           // setGenusData(genusData)
        });  //after every mount
    
    // console.log('I am family data after mounting')
    // console.log(familyData)

    const OnFamilyChange = (event) => {
        const filteredGenus = genusData.filter((genus) => {
        console.log('iiiiiiiiiiii')
        console.log(event.target.value)

        return (genus.family_name == event.target.value
            
            ); 

       
        //update states of family,genus and species after mounting
        });
        setFamilyName(event.target.value);
        setGenusName('');
        setSpeciesName('');
        setGenusData(filteredGenus);
        setSpeciesData([])
   
    };
    // console.log('genus after selecting family')

    // console.log(genusData)
    // console.log('genus_id')
    // console.log(genusId)
    // console.log('SpeciesID after')
    // console.log(speciesId)
    // console.log(speciesData)

        //manage the state of genus details 
        // filter species of the selected family and genus
        // reset the values of genus to selected genus name, 
        // value of species  set to original value(empty string)
        //value of species data set to filtered list of family and genus
        console.log('hhhhhhhhh')
        console.log(speciesData)

        console.log(speciesData.filter((specie)=>specie.family_name=='Apocynaceae' && specie.genus_name=='Acokanthera'))


   const OnGenusChange = (event) => {
        const filteredSpecies = speciesData.filter((specie) => {
        return (specie.family_name == familyName &&
            specie.genus_name==event.target.value);
        
            //update states of family,genus and species after mounting
        });
        setGenusName(event.target.value);
        setSpeciesName('');
        setSpeciesData(filteredSpecies);
    }
    ;
    // console.log('data filterd on on selecting the genus')
    // console.log('genusData')
    // console.log(genusData)
    // console.log('genus_id')
    // console.log(genusId)
    // console.log('gnusData')
    // console.log(genusData)
    // console.log('speciesData')
    // console.log(speciesData)




    // console.log('SpeciesID after')
    // console.log(speciesId)
    // console.log(speciesData)

    const OnSpeciesChange = (event) => {
        setSpeciesName(event.target.value);
    }
        // console.log('data after selecting species')
        // console.log('family data')

        // console.log(familyData)
        // console.log('genusData')

         //console.log(genusData)

        // console.log('Species after')
        // console.log(speciesData)
        // console.log('family name')
        // console.log(familyName)
        // console.log('genusName')   
        // console.log(genusName)  
        // console.log('speciesName')
        // console.log(speciesName)

        return (
            <div className="container">
              <div className="row">
                <div className="col-12">
                  <h3>Family-Genus-Species Dropdowns </h3>
                </div>
              </div>
              <div className="row">
                <div className="col-4">
                  <select
                    className="form-control"
                    name="country"
                    value={familyName}
                    onChange={(event) => OnFamilyChange(event)}
                  >
                    <option value>Select Family</option>
                    {familyData.map((event, key) => {
                      return (
                        <option key={key} value={event.family_name}>
                          {event.family_name}
                        </option>
                      );
                    })}
                  </select>
                </div>
                <div className="col-4">
                  <select
                    className="form-control"
                    name="state"
                    value={genusName}
                    onChange={(event) => OnGenusChange(event)}
                  >
                    <option value>Genus Name</option>
                    {genusData.map((event, key) => {
                      return (
                        <option key={key} value={event.genus_name}>
                          {event.genus_name}
                        </option>
                      );
                    })}
                  </select>
                </div>
                <div className="col-4">
                  <select
                    className="form-control"
                    name="city"
                    value={speciesName}
                    onChange={(event) => OnSpeciesChange(event)}
                  >
                    <option value>Select Species</option>
                    {speciesData.map((event, key) => {
                      return (
                        <option key={key} value={event.species_name}>
                          {event.species_name}
                        </option>
                      );
                    })}
                  </select>
                </div>
              </div>
            </div>
          );
      
 }


