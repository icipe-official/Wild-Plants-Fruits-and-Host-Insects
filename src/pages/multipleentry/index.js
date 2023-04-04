import Main from "components/multipleentry/planttype";
import CheckboxGroup from "components/multipleentry/multipleEntryMUI";
// import GroupcheckboxAPI from "components/multipleentry/multip;eentryMUIAPI"
// import GroupcheckboxColor from "components/multipleentry/fruitcolor"
import QuerySelect from "components/multipleentry/trialAllclientside";
import { Container } from "@mui/material";
export default function GroupCheckboxMin(props) {
  return (
    <Container>
      <QuerySelect />
    </Container>
  );
}
// export async function getStaticProps() {
//   // console.log('context.params');
//   const size = await fetch(
//     "http://localhost:3000/api/multipleEntry/checkboxFruitsize"
//   );
//   const fruit_size_data = await size.json();
//   //  console.log('data')

//   //fruit color data
//   const type = await fetch(
//     "http://localhost:3000/api/multipleEntry/checkboxColor"
//   );
//   const fruit_color_data = await type.json();
//   console.log(fruit_size_data);

//   // plant_type data
//   const plant = await fetch(
//     "http://localhost:3000/api/multipleEntry/plantType"
//   );
//   const plant_type_data = await plant.json();
//   console.log(plant_type_data);

//   // fruit_type data
//   const fruit_type = await fetch(
//     "http://localhost:3000/api/multipleEntry/fruitType"
//   );
//   const fruit_type_data = await fruit_type.json();
//   console.log("fruit_type_data  server side");

//   console.log(fruit_type_data);

//   // fruit_shape data
//   const fruit_shape = await fetch(
//     "http://localhost:3000/api/multipleEntry/fruitShape"
//   );
//   const fruit_shape_data = await fruit_shape.json();
//   console.log("fruit_shape_data  server side");

//   console.log(fruit_shape_data);

//   //Featch leaf type  data from API  to get leaf type
//   const plants = await fetch(
//     "http://localhost:3000/api/multipleEntry/leafType"
//   );
//   const plants_data = await plants.json();
//   console.log("plants_data serverside");
//   console.log(plants_data);

//   //Featch leat margin data from API  to get leaf type
//   const margins = await fetch(
//     "http://localhost:3000/api/multipleEntry/leafMargin"
//   );
//   const leaf_margin_data = await margins.json();
//   console.log("leaf_margin_data serverside");
//   console.log(leaf_margin_data);

//   //Featch leat arrangement data from API  to get leaf type
//   const arrangements = await fetch(
//     "http://localhost:3000/api/multipleEntry/leafArrangement"
//   );
//   const leaf_arrangement_data = await arrangements.json();
//   console.log("leaf_arrangement_data serverside");
//   console.log(leaf_arrangement_data);

//   //Featch spines and thorns data from API  to get leaf type
//   const spines = await fetch(
//     "http://localhost:3000/api/multipleEntry/thornsSpines"
//   );
//   const spines_data = await spines.json();
//   console.log("leaf_arrangement_data serverside");
//   console.log(spines_data);

//   //Featch latex data from API
//   const latex = await fetch("http://localhost:3000/api/multipleEntry/latex");
//   const latex_data = await latex.json();
//   console.log("latex_data serverside");
//   console.log(latex_data);

//   return {
//     props: {
//       fruit_size_data,
//       fruit_color_data,
//       plant_type_data,
//       fruit_type_data,
//       fruit_shape_data,
//       plants_data,
//       leaf_margin_data,
//       latex_data,
//       leaf_margin_data,
//       leaf_arrangement_data,
//       spines_data,

//       // photo_data:photo_data
//     },
//   };
// }
