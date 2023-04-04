import GroupcheckboxColor from "./fruitcolor";
export default function GroupcheckboxMain({fruit_color_data,fruit_size_data}){
  const [selected, setSelected] = useState(true);
  // const theme=useTheme()
  const [data,setData]=useState([])
  const [loaded,setLoaded]=useState(false)
  const [error,setError]=useState(null)
  const [query,setQuery]=useState({'colors':[],'sizes':[]})

  const [selectedColors, setSelectedColors] = useState([]);

  const handleColorChange = (colors) => {
    setSelectedColors(colors);
  };
  console.log(colors)

  // Use the selectedColors state to update the query
  // ...

  return (
    <div>
      <GroupcheckboxColor/>
      {/* Render other components */}
    </div>
  );

}