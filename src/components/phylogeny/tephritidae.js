import React, { useEffect, useState } from "react";

const TephritidaeNewick = () => {
  const [treeData, setTreeData] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch("./tephritidae.txt");
        const data = await response.text();
        setTreeData(data);
        // console.log("Newick Data:", data);
      } catch (error) {
        console.error("Error fetching Newick data:", error);
      }
    };

    fetchData();
  }, []);

  return treeData?.props?.childre !== null ? <>{treeData}</> : null;
};

export default TephritidaeNewick;
