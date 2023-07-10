// This functional component implements cascading drop downs for plant Family-Genus-Species
// Import required libraries
// define state variables
// By default, family drop down shows the families available for user to select
// Selecting family calls the api for genus for the selected family
// and clears any available data of genus and species from previous search
// Selecting genus calls an api for fetching species data which are filterd based on the selected genus
import { useState } from "react";
import { useEffect } from "react";
import styles from "./searchbarWorking.module.css";
// import Select from "react-select";
export default function Searchbar(family) {
  const [familyId, setFamilyId] = useState("");
  const [genusId, setGenusId] = useState("");
  const [speciesId, setSpeciesId] = useState("");
  const [familyData, setfamilyData] = useState([]);
  const [genusData, setGenusData] = useState([]);
  const [speciesData, setSpeciesData] = useState([]);
  const [loaded, setLoaded] = useState(false);
  const [error, setError] = useState(null);
  useEffect(() => {
    // fetch family names api
    fetch("/api/plants/prisma_api/family")
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
  //   ////console.log(familyData)
  //   ////console.log('family')
  // useEffect(() => {
  //     countriesData(FamilyData)})
  ////console.log('FamilyData');
  ////console.log('familyId');
  ////console.log(familyId);

  const OnFamilyChange = (e) => {
    // fetch genus based on genus selected
    fetch("/api/plants/prisma_api/genus")
      .then((res) => res.json())
      .then(
        (result) => {
          const filteredgenus = result.filter(
            (genus) => genus.family_id == e.target.value
          );
          setLoaded(true);
          setGenusData(filteredgenus);
        },
        (error) => {
          setLoaded(true);
          setError(error);
        }
      );
    setFamilyId(e.target.value);
    setGenusId("");
    setSpeciesId("");
    setSpeciesData([]);
  };
  ////console.log('familyId');
  ////console.log(familyId);
  ////console.log('genusId');
  ////console.log(genusId);
  ////console.log('genus_data');
  ////console.log(genusData);
  ////console.log('genusId');
  ////console.log(genusId);
  const OnGenusChange = (e) => {
    // fetch species names based on family and genus selected
    fetch("/api/plants/prisma_api/plantSpecies")
      .then((res) => res.json())
      .then(
        (result) => {
          const filteredspecies = result.filter(
            (specie) =>
              specie.genus_id == e.target.value &&
              specie.genus.family_id == familyId
          ); /// mapping ids of family with that stored in familyid
          setLoaded(true);
          setSpeciesData(filteredspecies);
        },
        (error) => {
          setLoaded(true);
          setError(error);
        }
      );

    setGenusId(e.target.value);
    setSpeciesId("");
  };

  const OnSpeciesChange = (e) => {
    const { value } = e.target;
    setSpeciesId(value);
    window.location.href = `/plants/prisma_api/${value
      .split(" ")
      .slice(1)
      .join(" ")}`; // split with space, splice to get species name
  };
  ////console.log('species_data');
  ////console.log(speciesData);

  return (
    <div className={styles.container}>
      <div className="row" />
      <div className={styles.inner}>
        <div className={styles.select}>
          <select
            className="form-control"
            name="family"
            value={familyId}
            onChange={(e) => OnFamilyChange(e)}
          >
            <option value>Select Family</option>
            {familyData.map((e, key) => (
              <option key={key} value={e.id}>
                {e.family_name}
              </option>
            ))}
          </select>
        </div>
        <div className={styles.inner}>
          <div className={styles.select}>
            <select
              className="form-control"
              name="genus"
              value={genusId}
              onChange={(e) => OnGenusChange(e)}
            >
              <option value>Select Genus</option>
              {genusData.map((e, key) => (
                <option key={key} value={e.id}>
                  {e.genus_name}
                </option>
              ))}
            </select>
          </div>
        </div>
        <div className={styles.inner}>
          <div className={styles.select}>
            <select
              className="form-control"
              name="species"
              value={speciesId}
              onChange={(e) => OnSpeciesChange(e)}
            >
              <option value>Select Species</option>
              {speciesData.map((e, key) => (
                <option key={key} value={e.id}>
                  {`${e.genus.genus_name} ${e.species_name}`}
                </option>
              ))}
            </select>
          </div>
        </div>
      </div>
    </div>
  );
}
