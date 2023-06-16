// import styles from './searchbar.module.css' // get access to styles for this componeny
import Select from "react-select";
import { useEffect } from "react";
import { useState } from "react";
//import Link from 'next/link';
import Image from 'next/image';
// Note: the empty deps array [] means
// this useEffect will run once
export default function Species() {
    const [loaded, setLoaded] = useState(false); // manage sate of data loading from api
    const [obtained, setObtained] = useState(""); //manage state for json data before and after loading
    const [paginate, setpaginate] = useState(10); //manage pagination
    const [error, setError] = useState(null); //manag error statte
    const [familyFilter, setFamilyFilter] = useState([]); //manage state for filtering by family
    const [genusfilter, setGenusFilter] = useState([]);
    const [genusSearch, setGenusSearch] = useState("iii");
    const [familySearch, setFamilySearch] = useState("");    // manage search  for family
    const [specieDetails, setSpecieDetails] = useState("");    // manage search  for family

    const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;

    useEffect(() => {
// fetch api
        fetch(
            `${base_url}/api/species`
        )
            .then((res) => res.json())
            .then(
                (result) => {
                    setLoaded(true);
                    setObtained(result);
                },
                (error) => {
                    setLoaded(true);
                    setError(error);
                }
            );
    }, []);
     console.log(obtained)
    const species_data = Object.values(obtained);
    const filterByFamily = [...new Set(species_data.map((family) => family.family_name))].sort();
    const options=filterByFamily.sort().map((family) => ({value:family,label:family}))

    const query_params = Object.keys(Object.assign({}, ...species_data));  //get json keys 
    const name=query_params[0]+ ' ' + query_params[1]
    //console.log(query_params)
    //console.log(name)


  
   // console.log('species_data')
    //Testing family search
    // const family_filter= species_data.filter(
    //     (item) =>
    //         item.family_name.includes("Apocynaeceae") &&
    //         query_params.some((parameter) =>
    //             item[parameter].toString().toLowerCase().includes(familySearch)
    //         ))
    // console.log("yyy")
   // console.log(family_filter)
// Testing if I can filter genus from family and worked
    // console.log(family_filter.filter(
    //     (item) =>
    //         item.genus_name.includes("Acokanthera") &&
    //         query_params.some((parameter) =>
    //             item[parameter].toString().toLowerCase().includes(genusSearch)
    //         )))

    function Filter(species_data) {   //searching based on query parameters
        //Filter species by family
        // Filter species by genus from  each family 
        const family= species_data.filter(
            (item) =>
                item.family_name.includes(familyFilter)   // filter will be  set to value of family  selected by user(event.target.value)
                
        
        )

        console.log(family)
        const family_set = [...new Set(family.map((family) => family.family_name))].sort();

        console.log(family_set)

        // Group the family obtained above by genus based on users' input
        const genus=family.filter(
                (item) =>
                    item.genus_name.includes(genusfilter)
        
        )
        const genus_set = [...new Set(genus.map((genus) => genus.genus_name))].sort();

        const species=genus.map(specie =>specie.species_name)
        const handleChangeFamily=(event)=>{
            setFamilyFilter(event.value)

        console.log("change",(typeof event.value))};
        const handleChangeGenus=(event)=>{
            setGenusFilter(event.value)
        
        console.log("change",event.value)};

        const handleChangeSpecie=(zz)=>{
            setSpecieDetails(zz.value)
        console.log("change",zz.value)};

    
        
        return(
        <div>
        <span>Family:</span>
        <Select 
         //defaultValue={setFamilySearch}
        options={options}
        onChange={handleChangeFamily}
        defaultValue={options[1]}
        //isMulti
      // isClearable
        />
     <span>Genus:</span>

        <Select
         options={genus_set.sort().map((genus) => ({value:genus,label:genus}))}
         onChange={handleChangeGenus}
        isClearable
         />
        <span>Species:</span> 

         <Select
        options={species.sort().map((specie) => ({value:specie,label:specie}))}
        onChange={handleChangeSpecie}

        />
      <pre>{JSON.stringify(familyFilter, 0, 2)}</pre>
      <pre>{JSON.stringify(genusfilter, 0, 2)}</pre>
      <pre>{JSON.stringify(specieDetails, 0, 2)}</pre>
        </div>)
    
    }




    // function get_F(species_data) {   //searching based on query parameters
    //     // Filter species by family
    //     // Filter species by genus from  each family 
    //     const filterd_family= species_data.filter(
    //         (item) =>
    //             item.family_name.includes(familyFilter) &&   // filter will be  set to value of family  selected by user(event.target.value)
    //             query_params.some((parameter) =>
    //                 item[parameter].toString().toLowerCase().includes(familySearch) 
    //             )
        
    //     )
    //     return(
    //          [...new Set(filterd_family.map((genus) => genus.genus_name))]

            
    //     )
    //     }
    //    // console.log(get_F(species_data))
    // function genusFamily(Filter) {   //searching based on queried family
    //     return Filter.filter(
    //         (item) =>
    //             item.genus_name.includes(genusfilter) &&
    //             query_params.some((parameter) =>
    //                 item[parameter].toString().toLowerCase().includes(genusSearch)
    //             )
    //     );
    // }
    // const more = (event) => {
    //     setpaginate((prevValue) => prevValue + 10);
    // };

    if (error) {
        return <>{error.message}</>;
    } else if (!loaded) {
        return <>loading...</>;
    } else {
        return (
            <div>{Filter(species_data)}</div>
        )
    }
}

