export default function Species({ specie }) {
    return (
      <div>
        <h1>{specie.insect_photos}</h1>
        {/* <p>{specie}</p> */}
      </div>
    );
  }
  
  export async function getStaticPaths() {
    const res = await fetch("http://localhost:3000/api/insects/Ceratitis");
    const species = await res.json();
  
    const paths = species.map((specie) => ({
      params: { species: specie.species_name },
    }));
  console.log(paths)
    return { paths, fallback: false };
  }
  
  export async function getStaticProps({ params }) {
    const res = await fetch(`http://localhost:3000/api/insects/photos/${params.species}`);
    const specie = await res.json();
  
    return {
      props: {
        specie,
      },
    };
  }
  