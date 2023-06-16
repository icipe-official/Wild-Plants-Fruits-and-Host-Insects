//import styles from './../family.module.css' // get access to styles for this componeny
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
    const [genusSearch, setGenusSearch] = useState("");
    const [familySearch, setFamilySearch] = useState("");    // manage search  for family
   // const [speciesSearch, setSpeciesSearch] = useState("");    // manage search  for family







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
    const filterByFamily = [...new Set(species_data.map((family) => family.family_name))];
    const filterByGenus = [...new Set(species_data.map((genus) => genus.genus_name))];

    const query_params = Object.keys(Object.assign({}, ...species_data));  //get json keys 
    const name=query_params[0]+ ' ' + query_params[1]
    console.log(query_params)
    console.log(name)

    console.log('species_data')
    //Testing family search
    const family_filter= species_data.filter(
        (item) =>
            item.family_name.includes("Apocynaeceae") &&
            query_params.some((parameter) =>
                item[parameter].toString().toLowerCase().includes(familySearch)
            ))
    console.log("yyy")
    console.log(family_filter)
// Testing if I can filter genus from family and worked
    console.log(family_filter.filter(
        (item) =>
            item.genus_name.includes("Acokanthera") &&
            query_params.some((parameter) =>
                item[parameter].toString().toLowerCase().includes(genusSearch)
            )))

    function Filter(species_data) {   //searching based on query parameters
        // Filter species by family
        // Filter species by genus from  each family 
        const filterd_family= species_data.filter(
            (item) =>
                item.family_name.includes(familyFilter) &&   // filter will be  set to value of family  selected by user(event.target.value)
                query_params.some((parameter) =>
                    item[parameter].toString().toLowerCase().includes(familySearch) 
                )
        
        )
        // Group the family obtained above by genus based on users' input
        return(
            filterd_family.filter(
                (item) =>
                    item.genus_name.includes(genusfilter) &&
                    query_params.some((parameter) =>
                        item[parameter].toString().toLowerCase().includes(genusSearch)
                    )
        ))
        
    }



    function get_F(species_data) {   //searching based on query parameters
        // Filter species by family
        // Filter species by genus from  each family 
        const filterd_family= species_data.filter(
            (item) =>
                item.family_name.includes(familyFilter) &&   // filter will be  set to value of family  selected by user(event.target.value)
                query_params.some((parameter) =>
                    item[parameter].toString().toLowerCase().includes(familySearch) 
                )
        
        )
        return(
             [...new Set(filterd_family.map((genus) => genus.genus_name))]

            
        )
        }
        console.log(get_F(species_data))
    function genusFamily(Filter) {   //searching based on queried family
        return Filter.filter(
            (item) =>
                item.genus_name.includes(genusfilter) &&
                query_params.some((parameter) =>
                    item[parameter].toString().toLowerCase().includes(genusSearch)
                )
        );
    }
    const more = (event) => {
        setpaginate((prevValue) => prevValue + 10);
    };

    if (error) {
        return <>{error.message}</>;
    } else if (!loaded) {
        return <>loading...</>;
    } else {
        return (
            <div className={styles.wrapper}>
                    <div className={styles.searchwrapper}>
                
                    <div className={styles.select}>
                        <select
                            onChange={(event) => setFamilyFilter(event.target.value)}
                            className="custom-select"
                            aria-label="Filter Species by Family">
                              <option value="">Filter By Family</option>
                                    {filterByFamily.sort().map((family) => (
                                <option value={family}>{family}</option>
                            ))}
                        </select>
                        <span className="focus"></span>
                    </div>
                    <div className={styles.select}>
                        <select
                            onChange={(event) => setGenusFilter(event.target.value)}
                            className="custom-select"
                            aria-label="Filter Species by Genus">
                              <option value="">Filter By Genus</option>


                                    {get_F(species_data).map((genus) => (
                                        
                                <option value={genus}>{genus}</option>
                            ))}
                        </select>
                  
                        <span className="focus"></span>
                </div>
                <label htmlFor={styles.searchform}>
                        <input
                            type="search"
                            name={styles.searchform}
                            id={styles.searchform}
                            className={styles.searchinput}// size of the search iput border
                            placeholder="Species search"
                            onChange={(event) => setGenusFilter(event.target.value)}
                        />
                        <span className={styles.sronly}></span>
                    </label>
                </div>
            
                <ul className={styles.cardgrid}>
                    {Filter(species_data)
                        .slice(0, paginate)
                        .map((item) => (
                            <li key={item.id}>
                                <article className={styles.card}>
                                    <div className={styles.cardimage}>
                                    <Image
                                       src={`/plants/${item.photo}`}
                                        alt={item.genus_name + ' '+ item.species_name}
                                        width={500}
                                        height={400}
                                        />
                                    </div>
                                    <div className={styles.cardcontent}>
                                        <h2 className={styles.cardname}>
                                            {item.name}
                                        </h2>
                                        <ol className={styles.cardlist}>
                                            <li>
                                                name:{" "}
                                                <span>{item.genus_name +' ' + item.species_name}</span>
                                                {/* <span><Link href={'../'}>{item.genus_name +' ' + item.species_name}</Link></span> */}

                                            </li>
                                            <li>
                                                Family:{" "}
                                                <span>{item.family_name}</span>
                                            </li>
                                            <li>
                                                Genus:{" "}
                                                <span>{item.genus_name}</span>
                                            </li>
                                        </ol>
                                    </div>
                                </article>
                            </li>
                        ))}
                </ul>
                
                <button onClick={more}>More photos</button>
            </div>
        );
    }
}

