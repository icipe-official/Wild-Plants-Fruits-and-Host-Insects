import React, { useEffect, useState } from "react";

export default function Mafft({ sequenceList }) {
  const [newick, setNewick] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      if (sequenceList) {
        const sequences = {};
        for (const { name, sequence } of sequenceList) {
          sequences[name] = sequence;
        }

        const requestBody = {
          sequences,
        };

        try {
          const response = await fetch("http://localhost:3000/api/phylogeny", {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify(requestBody),
          });

          if (!response.ok) {
            throw new Error(`Error: ${response.status}`);
          }

          const data = await response.json();
          const { newick } = data;
          setNewick(newick);
          ////console.log(data);
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
