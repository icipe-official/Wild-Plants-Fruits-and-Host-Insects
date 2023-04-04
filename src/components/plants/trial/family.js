// function that displays glossary names
// Use PascalCase for React components, or lowercase for HTML elements.
export default function Family(){
   const families = ["Malvaceae","Euphorbiaceae","Acanthaceae","Lamiaceae","Lamiaceae"];
    const familylist = families.map((family) => 
  // Key should be specified inside the array.
  <li key={family.id}>
      {family}
        </li>);

    return (
      <ul>{familylist}</ul>);
  
  }