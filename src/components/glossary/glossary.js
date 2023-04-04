// // function that displays glossary names
// // Use PascalCase for React components, or lowercase for HTML elements.
export default function Glossary(props){
    const glossaries = ["round","glob","straight","narrow"];
    //const teams = props.teams;
    const glossarylist = glossaries.map((glossary) => 
  // Key should be specified inside the array.
  <li key={glossary.id}>
      {glossary}
        </li>);
      
    return (
      <ul>{glossarylist}</ul>);  // error if ordered list
  
  }
// function that displays glossary names
// Use PascalCase for React components, or lowercase for HTML elements.
// export default function Order(){
//   const orders = ["round","glob","straight","narrow"];
//   const orderlist = orders.map((order) => 
// //Key should be specified inside the array.
// <li key={order.id}>
//     {order}
//       </li>);
    
//   return (
//     <ul>{orderlist}</ul>);

// }