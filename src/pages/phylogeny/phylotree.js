import { useEffect, useState } from "react";
import { phylotree } from "phylotree";

export default function MyComponent() {
  const newick = "(((A:0.1,B:0.2):0.3,C:0.4):0.5,D:1.0);";
  const [renderedTree, setRenderedTree] = useState(null);

  useEffect(() => {
    const tree = new phylotree(newick);
    const height = 500;
    const width = 500;

    const colorNodesByName = (node) => {
      // Your node color styling logic here
    };

    const colorEdgesByTarget = (edge) => {
      // Your edge color styling logic here
    };

    const rt = tree.render({
      height,
      width,
      "left-right-spacing": "fit-to-size",
      "align-tips": true,
      "node-styler": colorNodesByName,
      "edge-styler": colorEdgesByTarget,
    });

    rt.nodeLabel((n) => `${n.data.name} HELLO`);

    setRenderedTree(rt);
    ////console.log(rt);
  }, []);
  return (
    <div>
      {renderedTree ? (
        <div dangerouslySetInnerHTML={{ __html: renderedTree.__html }} />
      ) : (
        "Loading..."
      )}
    </div>
  );
}
