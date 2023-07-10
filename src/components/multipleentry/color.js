// Use PascalCase for React components, or lowercase for HTML elements.
import { useEffect, useState } from "react";

export default function FruitCheckbox(fruit_color_data) {
  const [selected, setSelected] = useState(true);
  // const theme=useTheme()
  const [data, setData] = useState([]);
  const [loaded, setLoaded] = useState(false);
  const [error, setError] = useState(null);
  ////console.log('fruit_color');
  ////console.log(fruit_color_data.fruit_color_data.fruit_color_data);

  const fruit_color_array = Array.from(
    fruit_color_data.fruit_color_data.fruit_color_data
  ).map(
    (specie) =>
      // return a list of fruit color
      specie.color
  ); // Team is the dynamic page file name
  ////console.log('fruit_color_array');

  ////console.log(fruit_color_array);

  ////console.log('Themeprovidetr');
  const [checkedState, setCheckedState] = useState(
    new Array(fruit_color_array.length).fill(false)
  );
  const [query, setQuery] = useState({ fruit: [], leaf: [] });
  // const handleQuery=(position)=>{
  //   query[fruit]=query[fruit].push(fruit_size_array[position])
  // }
  const handleOnChange = (position) => {
    const updatedCheckedState = checkedState.map((item, index) =>
      index === position ? !item : item
    );
    setCheckedState(updatedCheckedState);
    // setQuery.fruit[fr]
    const fruitSizeIndex = checkedState.flatMap((bool, index) =>
      bool ? index : []
    ); // extract only true values index
    // loop over selected values and append to the list for query
  };
  const handleData = (query) => {
    // fetch genus based on genus selected
    fetch(
      `/api/plants/prisma_api/multipleEntry/multipleEntryTrial?${{ query }}`
    )
      .then((res) => res.json())
      .then(
        (result) => setData(result),
        (error) => {
          setLoaded(true);
          setError(error);
        }
      );
  };
  const handleQuery = () => {
    const fruitSizeIndex = checkedState.flatMap((bool, index) =>
      bool ? index : []
    ); // extract only true values index
    const len = fruitSizeIndex.length;
    const fr = fruitSizeIndex.map((i) => fruit_color_array[i]);
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit: fr, leaf: [] })); // setting state in dictionary
    ////console.log('query');
    handleData(query);
    return "yy";
    ////console.log(query);
  };
  ////console.log('query');
  ////console.log('checkedState');
  // ////console.log(checkedState)
  // ////console.log(query)
  ////console.log('fruit_color_data');
  // ////console.log('query')
  // ////console.log(query)
  ////console.log(fruit_color_data);
  // ////console.log('data')
  // ////console.log(Array.from(data))

  return (
    <div className="App">
      <p>Fruit Color</p>
      <ul className="toppings-list">
        {fruit_color_array.map((name, index) => (
          <li key={index}>
            <div className="toppings-list-item">
              <div className="left-section">
                <input
                  type="checkbox"
                  id={`custom-checkbox-${index}`}
                  name={name}
                  value={name}
                  checked={checkedState[index]}
                  onChange={() => {
                    handleOnChange(index), handleQuery(query);
                  }}
                />
                <label htmlFor={`custom-checkbox-${index}`}>{name}</label>
              </div>
            </div>
          </li>
        ))}
      </ul>

      {/* <div>{data.map((d)=>d.genus_name)}</div> */}
    </div>
  );
}
