// import React, { useEffect, useRef } from "react";
// import * as d3 from "d3";
// import { Newick } from "newick";

// export default function PhylogeneticTree() {
//   const data =
//     "(seq1:0.4429295199,seq2:1.0731667736,seq3:0.0000026409,seq4:0.0000026409,)";

//   const newick = new Newick(data);
//   const parsedData = newick.parse(data);
//   const ref = useRef();

//   useEffect(() => {
//     const width = 500;
//     const height = 300;
//     const margin = { top: 10, right: 40, bottom: 10, left: 30 };
//     const innerWidth = width - margin.left - margin.right;
//     const innerHeight = height - margin.top - margin.bottom;
//     const root = d3.hierarchy(parsedData, (d) => d.branchset || 0.0);
//     const treeLayout = d3.tree().size([innerHeight, innerWidth]);
//     treeLayout(root);

//     const svg = d3
//       .select(ref.current)
//       .attr("viewBox", [-margin.left, -margin.top, width, height])
//       .style("font", "12px sans-serif");

//     const link = svg
//       .selectAll("path")
//       .data(root.links())
//       .join("path")
//       .attr("fill", "none")
//       .attr("stroke", "#ccc")
//       .attr("stroke-width", 2)
//       .attr(
//         "d",
//         (d) => `
//          M${d.source.y},${d.source.x}
//          L${(d.source.y + d.target.y) / 2},${d.source.x}
//          L${(d.source.y + d.target.y) / 2},${d.target.x}
//          L${d.target.y},${d.target.x}
//        `
//       );
//     const node = svg
//       .selectAll("g")
//       .data(root.descendants())
//       .join("g")
//       .attr("transform", (d) => `translate(${d.y},${d.x})`);

//     node
//       .append("circle")
//       .attr("fill", (d) => (d.children ? "#555" : "#999"))
//       .attr("r", 4);

//     node
//       .append("text")
//       .attr("dy", "0.31em")
//       .attr("x", (d) => (d.children ? -6 : 6))
//       .attr("text-anchor", (d) => (d.children ? "end" : "start"))
//       .text((d) => d.data.name);

//     node
//       .append("text")
//       .attr("dy", "0.31em")
//       .attr("x", (d) => (d.children ? -6 : 6))
//       .attr("text-anchor", (d) => (d.children ? "end" : "start"))
//       .attr("transform", (d) => `translate(${d.data.length / 2},0)`);

//     // adjust y-coordinate based on distance to parent
//     root.each((d) => {
//       d.y = d.depth * 50; // adjust the factor as needed
//     });
//   }, []);

//   return <svg ref={ref}></svg>;
// }
import { useEffect, useRef } from "react";
import * as d3 from "d3";
import { Newick } from "newick";

export default function NetworkDiagram({ plantData }) {
  const svgRef = useRef();
  const data =
    "(seq1:0.4429295199,seq2:1.0731667736,seq3:0.0000026409,seq4:0.0000026409,)";
  const newick = new Newick(data);
  const parsedData = newick.parse(data);

  const insectData = [
    {
      name: "Honey Bee",
      regions: ["North America", "Europe", "Asia"],
      taxonomy: "Apidae",
    },
    {
      name: "Ladybug",
      regions: ["North America", "Europe", "Asia"],
      taxonomy: "Coccinellidae",
    },
    {
      name: "Butterfly",
      regions: ["North America", "Europe"],
      taxonomy: "Lepidoptera",
    },
    {
      name: "Ant",
      regions: ["South America", "Africa", "Asia"],
      taxonomy: "Formicidae",
    },
    {
      name: "Dragonfly",
      regions: ["North America", "South America", "Africa", "Asia"],
      taxonomy: "Odonata",
    },
  ];

  useEffect(() => {
    const width = 500;
    const height = 300;
    const margin = { top: 10, right: 40, bottom: 10, left: 30 };
    const innerWidth = width - margin.left - margin.right;
    const innerHeight = height - margin.top - margin.bottom;
    const svg = d3.select(svgRef.current);

    // Create the plant tree
    const root = d3.hierarchy(parsedData, (d) => d.branchset || 0.0);
    const treeLayout = d3.tree().size([innerHeight, innerWidth]);
    treeLayout(root);
    const plantNodes = root.descendants();

    // Create the insect nodes
    const insectNodes = d3.range(insectData.length).map((i) => {
      return {
        id: `insect-${i}`,
        name: insectData[i].name,
        group: insectData[i].taxonomy,
      };
    });

    // Combine the plant and insect nodes
    const nodes = plantNodes.concat(insectNodes);

    // Create the links
    const links = plantNodes.slice(1).map((d) => {
      return {
        source: d.parent,
        target: d,
      };
    });

    const linksSelection = svg
      .selectAll("line")
      .data(links)
      .enter()
      .append("line")
      .attr("stroke", "gray")
      .attr("stroke-width", 1);
    const nodeSelection = svg
      .selectAll(".node")
      .data([...plantNodes, ...insectNodes])
      .enter()
      .append("circle")
      .attr("r", 5)
      .attr("fill", (d) => (d.type === "plant" ? "green" : "orange"));

    // Create the simulation
    const simulation = d3
      .forceSimulation([...plantNodes, ...insectNodes])
      .force("link", d3.forceLink(links))
      .force("charge", d3.forceManyBody().strength(-100))
      .force("center", d3.forceCenter(innerWidth / 2, innerHeight / 2))
      .force("collision", d3.forceCollide().radius(10))
      .on("tick", () => {
        linksSelection
          .attr("x1", (d) => d.source.x)
          .attr("y1", (d) => d.source.y)
          .attr("x2", (d) => d.target.x)
          .attr("y2", (d) => d.target.y);

        nodeSelection.attr("cx", (d) => d.x).attr("cy", (d) => d.y);
      });

    svg
      .append("g")
      .attr("class", "links")
      .selectAll("line")
      .data(links)
      .enter()
      .append("line")
      .attr("stroke", "gray")
      .attr("stroke-width", 1);

    svg
      .append("g")
      .attr("class", "nodes")
      .selectAll("circle")
      .data([...plantNodes, ...insectNodes])
      .enter()
      .append("circle")
      .attr("r", 5)
      .attr("fill", (d) => (d.type === "plant" ? "green" : "orange"));
    return (
      <div>
        <svg ref={svgRef} width={width} height={height}>
          // SVG content
        </svg>
      </div>
    );
  });
}
