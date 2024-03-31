import React, { useEffect, useState } from "react";

const RubiaceaeFasta = () => {
  const [fastaData, setFastaData] = useState(null);
  const [fastaObject, setFastaObject] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch("./rubiaceae.txt"); // Assuming your file is named rubiaceae.txt
        const data = await response.text();
        setFastaData(data);
      } catch (error) {
        console.error("Error fetching FASTA data:", error);
      }
    };

    fetchData();
  }, []);

  useEffect(() => {
    const parseFastaData = (data) => {
      if (!data) return null;

      const lines = data.split("\n");
      const sequences = {};
      let currentHeader = "";

      lines.forEach((line) => {
        if (line.startsWith(">")) {
          currentHeader = line.substring(1); // Remove '>' from header
          sequences[currentHeader] = "";
        } else if (currentHeader) {
          sequences[currentHeader] += line.trim();
        }
      });

      return sequences;
    };

    if (fastaData) {
      const parsedData = parseFastaData(fastaData);
      setFastaObject(parsedData);
    }
  }, [fastaData]);

  const formattedFastaObject = JSON.stringify(fastaObject, null, 2);

  return <pre>{formattedFastaObject}</pre>;
};

export default RubiaceaeFasta;
