function CalculateSimilarityMatrix(sequenceDict) {
  function kmers(sequence, kmer) {
    const sequencekmers = [];
    for (let v = 0; v < sequence.length - kmer + 1; v++) {
      sequencekmers.push(sequence.slice(v, v + kmer));
    }
    return sequencekmers;
  }

  // count the number of shared kmers
  function CountIntersection(s1, s2, k) {
    const s1_kmers = kmers(s1, k);
    const s2_kmers = kmers(s2, k);
    const intersection = s1_kmers.filter((value) => s2_kmers.includes(value));
    ////console.log('intersection.length');
    ////console.log(s1_kmers);
    ////console.log(s2_kmers);
    ////console.log(intersection.length);

    return intersection.length;
  }

  // get the total number of k-mers in both sequence one and 2
  function CountUnion(s1, s2, k) {
    const s1_kmers = kmers(s1, k);
    const s2_kmers = kmers(s2, k);
    const union = [...new Set([...s1_kmers, ...s2_kmers])];
    ////console.log('union.length');
    ////console.log(union.length);
    return union.length;
  }

  // account for the length of sequence
  // get similarity
  function Sequencesimilarity(s1, s2, k) {
    ////console.log('Sequence similarity');
    const similarity = CountIntersection(s1, s2, k) / CountUnion(s1, s2, k);
    ////console.log(similarity);

    return similarity;
  }

  // Neighbour Joining Algorithm
  if (sequenceDict) {
    const names = sequenceDict.map((obj) => obj.name); // get sequence names from data array

    const k = 5; // k-tuple size
    // let n = Object.keys(data).length;

    const n = sequenceDict.length;
    const dist_mat = Array.from({ length: n }, () => new Array(n).fill(0));
    // avoid zero division
    const Epilson = 1e-6;

    for (let g = 0; g < n; g++) {
      for (let h = g + 1; h < n; h++) {
        const s1 = sequenceDict[g].sequence;
        const s2 = sequenceDict[h].sequence;
        const sim = Sequencesimilarity(s1, s2, k);
        const dist = 1 / (sim + Epilson);
        dist_mat[g][h] = dist;
        dist_mat[h][g] = dist;
      }
    }

    // Create object with both the distance matrix and the sequence names
    const result = {
      dist_mat,
      names,
    };

    return result;
  }
}

// finf minimum distance
function findMinimum(dist_mat) {
  let minimum = Infinity;
  let minimum_k;
  let minimum_j;
  for (let k = 0; k < dist_mat.length; k++) {
    for (let j = k + 1; j < dist_mat.length; j++) {
      if (dist_mat[k][j] < minimum) {
        minimum = dist_mat[k][j];
        minimum_k = k;
        minimum_j = j;
      }
    }
  }
  return [minimum_k, minimum_j, minimum];
}

export function Neighb(matrix, names) {
  // Create a node for each name
  const tree_nodes = names.map((name) => ({ name, dist: 0 }));

  while (tree_nodes.length > 1) {
    // Calculate the total distance for each node
    for (var i = 0; i < tree_nodes.length; i++) {
      let dist = 0;
      for (var j = 0; j < tree_nodes.length; j++) {
        dist += matrix[i][j];
      }
      tree_nodes[i].dist = dist;
    }

    // Find the minimum  value of Q
    const Q = [];
    for (var i = 0; i < tree_nodes.length; i++) {
      Q[i] = [];
      for (var j = 0; j < tree_nodes.length; j++) {
        Q[i][j] =
          (tree_nodes.length - 2) * matrix[i][j] -
          tree_nodes[i].dist -
          tree_nodes[j].dist;
      }
    }
    const min = findMinimum(Q, matrix); // pass dist_mat as second argument
    var i = min[0];
    var j = min[1];

    // Join the two nodes
    const NewNode = {
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
    const childStrings = node.children.map(getNewickString);
    return `(${childStrings.join(",")})` + `:${node.dist}`;
  }
  // Leaf node
  return `${node.name}:${node.dist}`;
}

export default CalculateSimilarityMatrix;
