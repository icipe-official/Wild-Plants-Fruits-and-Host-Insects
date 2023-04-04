import Link from "next/link";

export default function Species({ insects_data }) {
  console.log(insects_data.length)
  return (
    <div>
      <h1>Select a species genus</h1>
      <ul>
        {insects_data.map((specie) => (
          <li key={specie.id}>
            <Link href={`/species/${specie.species_name}`}>
              {specie.species_name}
            </Link>
          </li>
        ))}
      </ul>
    </div>
  );
}

export async function getStaticProps() {
  const res = await fetch("http://localhost:3000/api/insects/all/speciesAll");
  const insects_data = await res.json();

  return {
    props: {
      insects_data,
    },
  };
}
