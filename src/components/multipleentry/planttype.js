// Use PascalCase for React components, or lowercase for HTML elements.
import { useEffect, useState } from 'react';
export default function FruitCheckbox(Query_params){
  const [selected, setSelected] = useState(true);
  // const theme=useTheme()
  const [data,setData]=useState([])
  const [loaded,setLoaded]=useState(false)
  const [error,setError]=useState(null)
  const [query,setQuery]=useState({'colors':[],'sizes':[]})

  console.log('fruit_sizee')

  //console.log(fruit_size.fruit_size.fruit_size)
  const fruit_size_array= Array.from(Query_params.params.fruit_size_data).map(specie =>(
    // return a list of species
  specie.size)) //Team is the dynamic page file name
  // console.log('fruit_size_array')
  // console.log(fruit_size_array)
  // // fruit color data
  console.log('fruit_color')
  console.log(Query_params.params.fruit_size_data)

const fruit_color_array= Array.from(Query_params.params.fruit_color_data).map(specie =>(
  // return a list of fruit color
specie.color)) //Team is the dynamic page file name
//console.log('fruit_color_array')

//console.log(fruit_size)

// console.log('Themeprovidetr');
const [checkedStateSize, setCheckedStateSize] = useState(
  new Array(fruit_size_array.length).fill(false)
);
const handleOnChangeSize = (position) => {
  const updatedCheckedStateSize = checkedStateSize.map((item, index) =>
    index === position ? !item : item,
    );
    const fruitSizeIndex=updatedCheckedStateSize.flatMap((bool,index)=>bool? index:[]) //extract only true values index
    const len=fruitSizeIndex.length
    const fr=fruitSizeIndex.map((i)=>
    fruit_size_array[i])
  setCheckedStateSize(updatedCheckedStateSize)
  setQuery(prevQueryInfo => ({...prevQueryInfo,sizes:fr})) //setting state in dictionary

  // setQuery.fruit[fr]
  // loop over selected values and append to the list for query
}

//Fruit color  box if checked
const [checkedStateColor, setCheckedStateColor] = useState(
  new Array(fruit_color_array.length).fill(false)
);
const handleOnChangeColor = (position) => {
  const updatedCheckedStateColor = checkedStateColor.map((item, index) =>
  
  index === position ? !item : item,
    );
  setCheckedStateColor(updatedCheckedStateColor)
  const fruitColorIndex=updatedCheckedStateColor.flatMap((bool,index)=>bool? index:[]) //extract only true values index
  const len=fruitColorIndex.length
  const fr=fruitColorIndex.map((i)=>
  fruit_color_array[i])
  setQuery(prevQueryInfo => ({...prevQueryInfo,colors:fr})) //setting state in dictionary
  // setQuery.fruit[fr]
  //const fruitSizeIndex=checkedStateColor.flatMap((bool,index)=>bool? index:[]) //extract only true values index
  // loop over selected values and append to the list for query
  
}

// const handleQueryFruitSize=()=>{
//   const fruitSizeIndex=checkedStateSize.flatMap((bool,index)=>bool? index:[]) //extract only true values index
//   const len=fruitSizeIndex.length
//   const fr=fruitSizeIndex.map((i)=>
//   fruit_size_array[i])
//   setQuery(prevQueryInfo => ({...prevQueryInfo,sizes:fr})) //setting state in dictionary
//   console.log('query')
//   //handleData(query)
//   return("yy"
//   )
//   console.log(query)
//   }
// const handleQueryFruitColor=()=>{
//   const fruitColorIndex=checkedStateColor.flatMap((bool,index)=>bool? index:[]) //extract only true values index
//   const len=fruitColorIndex.length
//   const fr=fruitColorIndex.map((i)=>
//   fruit_color_array[i])
//   setQuery(prevQueryInfo => ({...prevQueryInfo,colors:fr})) //setting state in dictionary
//   console.log('query')
//   //handleData(query)
//   return("yy"
//   )
  
//   }

  const handleData = () => {
    const i=JSON.stringify(query)
    //fetch genus based on genus selected
    // convert Query to JSON string
      fetch(
          'api/plants/prisma_api/multipleEntry/multipletrial?filters='+i

      )
          .then((res) => res.json())
          .then((result) => 
                  setData(result),
              (error) => {
                  setLoaded(true);
                  setError(error);
              }
          );
          // setCheckedStateColor(new Array(fruit_color_array.length).fill(false))
          // setCheckedStateSize(new Array(fruit_size_array.length).fill(false))
{/* <div>
  {data.map((d)=>d.species_name)}
</div> */}
        };
const handleCancel=()=>{
    setCheckedStateColor(new Array(fruit_color_array.length).fill(false))
    setCheckedStateSize(new Array(fruit_size_array.length).fill(false))
     setData([])

}
console.log('query')
console.log(query)
console.log('JSON.stringfy(query)')
console.log(JSON.stringify(query))
const j= JSON.stringify(query)
console.log('/api/plants/prisma_api/multipleEntry/multipletrial?filters='+j)
console.log('checkedStateSize')
console.log(checkedStateSize)

console.log('checkedStateColor')
console.log(checkedStateColor)
// console.log(query)
// console.log('fruit_size_array')
// console.log(fruit_size_array)
console.log('query')
console.log(query)
  //console.log(fr)
//console.log('data')
console.log(Array.from(data))
console.log('data')
console.log(data)
  return (
    <div className="App">
      <div>
    <p>Fruit size</p>
    <ul className="toppings-list">
      {fruit_size_array.map((name, index) => {
        return (
          <li key={index}>
            <div className="toppings-list-item">
              <div className="left-section">
                <input
                  type="checkbox"
                  //id={`custom-checkbox-${index}`}
                  name={name}
                  value={name}
                  checked={checkedStateSize[index]}
                  // onChange={() => {
                  //   handleOnChangeSize(index);
                  //   handleQueryFruitSize();
                  //   }}/>
                  onChange={() => handleOnChangeSize(index)}/>
                <label htmlFor={`custom-checkbox-${index}`}>{name}</label>
              </div>
            </div>
          </li>
        );
      })}
    </ul>
    </div>
    <br></br>
    <br></br>
    <div>
    <p>Fruit color</p>
    <ul className="toppings-list">
      {fruit_color_array.map((name, index) => {
        return (
          <li key={index}>
            <div className="toppings-list-item">
              <div className="left-section">
                <input
                  type="checkbox"
                  //id={`custom-checkbox-${index}`} //if unchecked, box selected even by clicking the name outside
                  name={name}
                  value={name}
                  checked={checkedStateColor[index]}
                  // onChange={() => {
                  //   handleQueryFruitColor();
                  //   }}/>
                  onChange={() =>  {handleOnChangeColor(index)}}
                /> 
                <label htmlFor={`custom-checkbox-${index}`}>{name}</label>
              </div>
            </div>
          </li>
        );
      })}
    </ul>
    </div>
    {/* Hanndle two functions on Click button */}
    <div>
    <button
      onClick={() => {
        // handleOnChangeColor();
        // handleOnChangeSize();
        handleData()
        setQuery({'colors':[],'sizes':[]})
        }}>
                Submit Query
             </button>
</div>
<div>
    <button
      onClick={() => {
        handleCancel()  // cancel any box checked
        }}>Clear Query
             </button>
</div>
<div>
  <p>{data.length} Records found</p>
  <br></br>
  {data.map((d)=>{
    return(
      <ul> {d.genus.genus_name+ ' '+d.species_name}</ul>)})}
{/* <select
                className="form-control"
                name="species"
                value={'species'}
                onChange={(e) => OnSpeciesChange(e)}
              >
                <option value>Select Species</option>
                {data.map((e, key) => {
                  return (
                    <option key={key} value={e.id}>
                      {e.genus.genus_name + ' '+ e.species_name}
                    </option>
                  );
                })}
              </select> */}
          
</div>

  </div>
  );
  }