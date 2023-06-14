import PlantFirstPage from "components/plants/plantsFirstPage";
export default function FirstPage(props) {
  return <PlantFirstPage props={props.data} />;
}

export async function getStaticProps() {
  try {
    const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;

    const response = await fetch(`${base_url}/api/plants/plantsPage/1`);

    const data = await response.json();
    // Process the fetched data and return it
    return {
      props: {
        data,
      },
    };
  } catch (error) {
    console.error("Error fetching data:", error);
    return {
      props: {
        error: "Failed to fetch data",
      },
    };
  }
}
