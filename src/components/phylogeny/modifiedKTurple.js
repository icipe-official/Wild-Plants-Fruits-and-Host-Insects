function CalculateSimilarityMatrixModified(sequenceDict, kmer) {
  // const [kmer,Setkmer]=useState(5);
  function kmers(sequence, kmer) {
    // Remove gaps and N's from the sequence
    sequence = sequence.replace(/-/g, "").replace(/N/g, "");
    let sequencekmers = [];
    for (let v = 0; v < sequence.length - kmer + 1; v++) {
      sequencekmers.push(sequence.slice(v, v + kmer));
    }
    return sequencekmers;
  }
  function replace(kmers) {
    const replaced_kmers = kmers.map((kmer) => {
      return kmer.replace(/[CTAG]/g, (match) => {
        if (match === "C" || match === "T") {
          return "Y";
        } else if (match === "A" || match === "G") {
          return "U";
        }
      });
    });

    return replaced_kmers;
  }

  // count the number of shared kmers
  function CountIntersection(s1, s2, k) {
    let s1_kmers = kmers(s1, k);
    let s2_kmers = kmers(s2, k);
    const set1 = new Set(s1_kmers);
    const set2 = new Set(s2_kmers);

    //   console.log("s2_kmers")

    //   console.log(s2_kmers)

    //       // Get unique kmers
    const unique1 = [...set1].filter((kmer) => !set2.has(kmer));
    console.log("unique1");

    // console.log(unique1)
    let unique1_replaced = replace(unique1);
    // console.log("unique1_replaced")

    console.log(unique1_replaced);
    const unique2 = [...set2].filter((kmer) => !set1.has(kmer));

    let unique2_replaced = replace(unique2);
    console.log("unique2_replaced");
    // console.log(unique2_replaced)

    //         // Add new shared kmers
    let s1_ktuples = new Set([...s1_kmers].concat(unique1_replaced));
    let s2_ktuples = new Set([...s2_kmers].concat(unique2_replaced));
    // convert to arrays and return the length of their intersection
    //   let s1_ktuples_arr = Array.from(s1_ktuples);
    //   let s2_ktuples_arr = Array.from(s2_ktuples);
    console.log("new kmers");

    // console.log(s1_ktuples)
    console.log("s1_ktuples 2");
    // console.log(s1_ktuples)

    const intersection = new Set(
      [...s1_ktuples].filter((x) => s2_ktuples.has(x))
    );

    //       console.log("intersection new");
    console.log(intersection);
    //       // console.log(s2_kmers);
    //       // console.log(intersection.length);

    return intersection.size;
  }

  // get the total number of k-mers in both sequence one and 2
  function CountUnion(s1, s2, k) {
    let s1_kmers = kmers(s1, k);
    let s2_kmers = kmers(s2, k);
    let union = [...new Set([...s1_kmers, ...s2_kmers])];
    // console.log("union.length");
    // console.log(union.length);
    return union.length;
  }

  // account for the length of sequence
  // get similarity
  function Sequencesimilarity(s1, s2, k) {
    console.log("Sequence similarity");
    const similarity = CountIntersection(s1, s2, k) / CountUnion(s1, s2, k);
    // console.log(similarity);

    return similarity;
  }
  if (sequenceDict) {
    let names = sequenceDict.map((obj) => obj.name); // get sequence names from data array

    let k = kmer; // k-tuple size
    // let n = Object.keys(data).length;

    const n = sequenceDict.length;
    const dist_mat = Array.from({ length: n }, () => new Array(n).fill(0));
    // avoid zero division
    const Epilson = 1e-6;

    for (let g = 0; g < n; g++) {
      for (let h = g + 1; h < n; h++) {
        let s1 = sequenceDict[g].sequence;
        let s2 = sequenceDict[h].sequence;
        let sim = Sequencesimilarity(s1, s2, k);
        let dist = 1 / (sim + Epilson);
        dist_mat[g][h] = dist;
        dist_mat[h][g] = dist;
      }
    }

    // Create object with both the distance matrix and the sequence names
    const result = {
      dist_mat,
      names,
    };
    console.log("dist_mat");

    console.log(dist_mat);
    return result;
  }
}

// finf minimum distance
function findMinimum(dist_mat) {
  var minimum = Infinity;
  var minimum_k, minimum_j;
  for (var k = 0; k < dist_mat.length; k++) {
    for (var j = k + 1; j < dist_mat.length; j++) {
      if (dist_mat[k][j] < minimum) {
        minimum = dist_mat[k][j];
        minimum_k = k;
        minimum_j = j;
      }
    }
  }
  return [minimum_k, minimum_j, minimum];
}

export function NeighborJoining(matrix, names) {
  // Create a node for each name
  var tree_nodes = names.map(function (name) {
    return { name: name, dist: 0 };
  });

  while (tree_nodes.length > 1) {
    // Calculate the total distance for each node
    for (var i = 0; i < tree_nodes.length; i++) {
      var dist = 0;
      for (var j = 0; j < tree_nodes.length; j++) {
        dist += matrix[i][j];
      }
      tree_nodes[i].dist = dist;
    }

    // Find the minimum  value of Q
    var Q = [];
    for (var i = 0; i < tree_nodes.length; i++) {
      Q[i] = [];
      for (var j = 0; j < tree_nodes.length; j++) {
        Q[i][j] =
          (tree_nodes.length - 2) * matrix[i][j] -
          tree_nodes[i].dist -
          tree_nodes[j].dist;
      }
    }
    var min = findMinimum(Q, matrix); // pass dist_mat as second argument
    var i = min[0];
    var j = min[1];

    // Join the two nodes
    var NewNode = {
      children: [tree_nodes[i], tree_nodes[j]],
      dist: matrix[i][j] / 2,
    };
    tree_nodes.splice(j, 1);
    tree_nodes.splice(i, 1, NewNode);

    // Construct Newick string for the current tree
    if (tree_nodes.length === 1) {
      // Tree has been fully constructed
      return getNewickString(tree_nodes[0]);
    }
  }
}

function getNewickString(node) {
  if (node.children) {
    // Internal node
    var childStrings = node.children.map(getNewickString);
    return "(" + childStrings.join(",") + ")" + ":" + node.dist;
  } else {
    // Leaf node
    return node.name + ":" + node.dist;
  }
}

export default CalculateSimilarityMatrixModified;
