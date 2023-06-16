import React, { useEffect, useState } from "react";

export default function Mafft({ sequenceList }) {
  const [newick, setNewick] = useState(null);
  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;

  useEffect(() => {
    const fetchData = async () => {
      if (sequenceList) {
        const sequences = {};
        for (const { name, sequence } of sequenceList) {
          sequences[name] = sequence;
        }

        const requestBody = {
          sequences: sequences,
        };

        try {
          const response = await fetch(`${base_url}/api/phylogeny`, {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify(requestBody),
          });

          if (!response.ok) {
            throw new Error("Error: " + response.status);
          }

          const data = await response.json();
          const newick = data.newick;
          setNewick(newick);
          console.log(data);
        } catch (error) {
          console.error(error);
        }
      }
    };

    fetchData();
  }, [sequenceList]);

  // Use the 'newick' variable in your code as needed

  return null; // Replace with your JSX code
}
