function CalculateSimilarityMatrixModified(sequenceDict, kmer) {
  // const [kmer,Setkmer]=useState(5);
  // function kmers(sequence, kmer) {
  //   console.log("sequences ready for processing");
  //   console.log(sequence);
  //   // Remove gaps and N's from the sequence
  //   sequence = sequence.replace(/-/g, "").replace(/N/g, "");
  //   let sequencekmers = [];
  //   for (let v = 0; v < sequence.length - kmer + 1; v++) {
  //     sequencekmers.push(sequence.slice(v, v + kmer));
  //   }
  //   return sequencekmers;
  // }
  function kmers(sequence, kmer) {
    console.log("foward sequence");
    console.log(sequence);

    // Remove gaps and N's from the sequence
    // sequence = sequence.replace(/-/g, "").replace(/N/g, "");
    let sequenceKmers = [];
    for (let v = 0; v < sequence.length - kmer + 1; v++) {
      sequenceKmers.push(sequence.slice(v, v + kmer));
    }

    // Generate kmers for the reverse of the original sequence
    const reverseSequence = sequence.split("").reverse().join("");
    for (let v = 0; v < reverseSequence.length - kmer + 1; v++) {
      // sequenceKmers.push(reverseSequence.slice(v, v + kmer));
    }
    console.log("reverseSequence");
    console.log(reverseSequence);

    //complementary sequence
    function complement(sequence) {
      const complementMap = {
        A: "T",
        T: "A",
        C: "G",
        G: "C",
      };

      let complementSequence = "";

      for (let i = 0; i < sequence.length; i++) {
        const base = sequence[i];
        const complementBase = complementMap[base];
        complementSequence += complementBase;
      }

      return complementSequence;
    }
    // Generate kmers for the complementary of the original sequence
    const complementary = complement(sequence);
    for (let v = 0; v < complementary.length - kmer + 1; v++) {
      // sequenceKmers.push(complementary.slice(v, v + kmer));
    }
    console.log("complementary");

    // console.log(complementary);
    // console.log(reverseSequence);

    const reverseSequencecomp = sequence.split("").reverse().join("");
    for (let v = 0; v < reverseSequencecomp.length - kmer + 1; v++) {
      // sequenceKmers.push(reverseSequencecomp.slice(v, v + kmer));
    }
    console.log("reverseSequence");

    return sequenceKmers;
  }

  // grouping of purines and pyrimidine
  function replace(kmers) {
    const replaced_kmers = kmers.map((kmer) => {
      return kmer.replace(/[99]/g, (match) => {
        if (match === "7" || match === "8") {
          return "Y";
        } else if (match === "7" || match === "0") {
          return "U";
        }
      });
    });

    return replaced_kmers;
  }

  // function replace(kmers) {
  //   const replaced_kmers = kmers.map((kmer) => {
  //     return kmer.replace(/[CTAG]/g, (match) => {
  //       if (match === "C" || match === "T") {
  //         return "Y";
  //       } else if (match === "A" || match === "G") {
  //         return "U";
  //       }
  //     });
  //   });

  //   return replaced_kmers;
  // }

  // count the number of shared kmers
  function CountIntersection(s1, s2, k) {
    let s1_kmers = kmers(s1, k);
    let s2_kmers = kmers(s2, k);
    const set1 = new Set(s1_kmers);
    const set2 = new Set(s2_kmers);

    console.log("s1_kmers");

    console.log(set1);
    console.log("s2_kmers");

    // s2_kmers;
    console.log(set2);
    //       // Get unique kmers
    const unique1 = [...set1].filter((kmer) => !set2.has(kmer));
    console.log("unique1");

    console.log(unique1);
    let unique1_replaced = replace(unique1);
    console.log("unique1_replaced");

    console.log(unique1_replaced);
    const unique2 = [...set2].filter((kmer) => !set1.has(kmer));
    console.log("unique2");
    console.log(unique2);

    let unique2_replaced = replace(unique2);
    console.log("unique2_replaced");
    console.log(unique2_replaced);

    //         // Add new shared kmers
    let s1_ktuples = new Set([...s1_kmers].concat(unique1_replaced));
    let s2_ktuples = new Set([...s2_kmers].concat(unique2_replaced));
    // convert to arrays and return the length of their intersection
    //   let s1_ktuples_arr = Array.from(s1_ktuples);
    //   let s2_ktuples_arr = Array.from(s2_ktuples);
    console.log("new kmers");

    // console.log(s1_ktuples);
    console.log("s1_ktuples 2");
    // console.log(s2_ktuples);

    const intersection = new Set(
      [...s1_ktuples].filter((x) => s2_ktuples.has(x))
    );

    console.log("intersection counttttt");
    console.log(intersection.size);
    console.log("intersection");
    console.log(intersection);

    return intersection.size;
  }

  // get the total number of k-mers in both sequence one and 2
  function CountUnion(s1, s2, k) {
    let s1_kmers = kmers(s1, k);
    let s2_kmers = kmers(s2, k);
    let union = [...new Set([...s1_kmers, ...s2_kmers])];
    console.log("union.length");
    console.log(union.length);
    console.log("union");

    console.log(union);

    return union.length;
  }

  // account for the length of sequence
  // get similarity
  // function Sequencesimilarity(s1, s2, k) {
  //   console.log("Sequence similarity");
  //   const similarity =
  //     (CountUnion(s1, s2, k) - CountIntersection(s1, s2, k)) /
  //     CountUnion(s1, s2, k);
  //   // console.log(similarity);

  //   return similarity;
  // }
  // function Sequencesimilarity(s1, s2, k) {
  //   const s1_kmers = kmers(s1, k);
  //   const s2_kmers = kmers(s2, k);

  //   const set1 = new Set(s1_kmers);
  //   const set2 = new Set(s2_kmers);

  //   console.log("s1_kmers");

  //   console.log(set1);
  //   console.log("s2_kmers");

  //   // s2_kmers;
  //   console.log(set2);
  //   //       // Get unique kmers
  //   const unique1 = [...set1].filter((kmer) => !set2.has(kmer));
  //   console.log("unique1");

  //   console.log(unique1);
  //   let unique1_replaced = replace(unique1);
  //   console.log("unique1_replaced");

  //   console.log(unique1_replaced);
  //   const unique2 = [...set2].filter((kmer) => !set1.has(kmer));
  //   console.log("unique2");
  //   console.log(unique2);

  //   let unique2_replaced = replace(unique2);
  //   console.log("unique2_replaced");
  //   console.log(unique2_replaced);

  //   //         // Add new shared kmers
  //   let s1_ktuples = new Set([...s1_kmers].concat(unique1_replaced));
  //   let s2_ktuples = new Set([...s2_kmers].concat(unique2_replaced));

  //   // Count the occurrences of each k-mer in sequence s1 and s2
  //   const countS1 = countKmers(s1_ktuples);
  //   const countS2 = countKmers(s2_ktuples);

  //   let d2 = 0;

  //   // Iterate over each unique k-mer
  //   for (const kmer of new Set([...s1_kmers, ...s2_kmers])) {
  //     const count1 = countS1[kmer] || 0; // Count of kmer in s1, default to 0 if not found
  //     const count2 = countS2[kmer] || 0; // Count of kmer in s2, default to 0 if not found

  //     // Calculate the contribution of this k-mer to the D2 dissimilarity
  //     const contribution = count1 * count2;
  //     d2 += contribution;
  //   }

  //   // Calculate the sum of squared counts for s1 and s2
  //   const sumSqS1 = Object.values(countS1).reduce(
  //     (sum, count) => sum + count ** 2,
  //     0
  //   );
  //   const sumSqS2 = Object.values(countS2).reduce(
  //     (sum, count) => sum + count ** 2,
  //     0
  //   );

  //   // Calculate the cosine similarity
  //   const cosine = d2 / (Math.sqrt(sumSqS1) * Math.sqrt(sumSqS2));

  //   // Scale the similarity to the range [0, 1]
  //   const similarity = (cosine + 1) / 2;

  //   return similarity;
  // }
  // // Helper function to count the occurrences of each k-mer in an array
  // function countKmers(kmers) {
  //   const count = {};
  //   for (const kmer of kmers) {
  //     count[kmer] = (count[kmer] || 0) + 1;
  //   }
  //   return count;
  // }
  function SequencesimilarityD2stra(s1, s2, k, m) {
    const s1_kmers = kmers(s1, k);
    const s2_kmers = kmers(s2, k);

    const set1 = new Set(s1_kmers);
    const set2 = new Set(s2_kmers);

    // Get unique kmers
    // const unique1 = [...set1].filter((kmer) => !set2.has(kmer));
    // const unique2 = [...set2].filter((kmer) => !set1.has(kmer));
    // const shared1 = s1_kmers.filter((kmer) => s2_kmers.includes(kmer));
    // const shared2 = s2_kmers.filter((kmer) => s1_kmers.includes(kmer));
    // const const_trial_set = new Set(shared1);
    // const const_trial_set2 = new Set(shared2);

    // console.log("trial shared kmers");
    // console.log(shared1);
    // console.log(const_trial_set);
    // console.log(shared2);
    // console.log(const_trial_set2);

    const unique1 = [...set1].filter((kmer) => !set2.has(kmer));
    console.log("unique1");

    console.log(unique1);

    const unique2 = [...set2].filter((kmer) => !set1.has(kmer));

    //         // Add new shared kmers
    let s1_ktuples = s1_kmers.concat(unique1);
    let s2_ktuples = s2_kmers.concat(unique2);

    // Count the occurrences of each k-mer in sequence s1 and s2
    const countS1 = countKmers(s1_ktuples);
    const countS2 = countKmers(s2_ktuples);

    let dotProduct = 0;
    let sumSqS1 = 0;
    let sumSqS2 = 0;

    // Iterate over each unique k-mer
    for (const kmer of new Set([...s1_ktuples, ...s2_ktuples])) {
      const count1 = countS1[kmer] || 0; // Count of kmer in s1, default to 0 if not found
      const count2 = countS2[kmer] || 0; // Count of kmer in s2, default to 0 if not found
      // Calculate the dot product of counts
      dotProduct += count1 * count2;

      // Calculate the sum of squared counts for s1 and s2
      sumSqS1 += count1 ** 2;
      sumSqS2 += count2 ** 2;
    }

    // Calculate the cosine similarity
    const cosineSimilarity =
      dotProduct / (Math.sqrt(sumSqS1) * Math.sqrt(sumSqS2));

    // Calculate the D2Star dissimilarity
    const tmpXD2Star = Math.sqrt(sumSqS1);
    const tmpYD2Star = Math.sqrt(sumSqS2);
    const resultD2Star =
      0.5 * (1 - cosineSimilarity / (tmpXD2Star * tmpYD2Star));

    return resultD2Star;
  }

  function minHashSimilarity(s1, s2, k, m) {
    // Generate MinHash signatures for s1 and s2
    const sig1 = generateMinHashSignature(s1, k, m);
    const sig2 = generateMinHashSignature(s2, k, m);

    // Count the number of matching positions between the signatures
    let matchingPositions = 0;
    for (let i = 0; i < m; i++) {
      if (sig1[i] === sig2[i]) {
        matchingPositions++;
      }
    }

    // Calculate the MinHash similarity estimate
    const minHashSimilarity = matchingPositions / m;

    return minHashSimilarity;
  }

  function generateMinHashSignature(sequence, k, m) {
    // Generate k-mers from the sequence
    const kMers = kmers(sequence, k);

    // Initialize an array to store the MinHash signature
    const signature = new Array(m).fill(Infinity);

    // Apply MinHash to each k-mer
    for (const kMer of kMers) {
      const hash = hashFunction(kMer); // Replace hashFunction with an appropriate hash function

      // Update the signature with the minimum hash value
      for (let i = 0; i < m; i++) {
        const hashValue = hash(i); // Apply the hash function to get the hash value
        signature[i] = Math.min(signature[i], hashValue);
      }
    }

    return signature;
  }

  // Helper function to count the occurrences of each k-mer in an array
  function countKmers(kmers) {
    const count = {};
    for (const kmer of kmers) {
      count[kmer] = (count[kmer] || 0) + 1;
    }
    return count;
  }
  function hashFunction(value) {
    // Convert the value to a string
    const str = String(value);

    // Apply the hashCode function to get the hash value
    let hash = 0;
    if (str.length === 0) {
      return hash;
    }
    for (let i = 0; i < str.length; i++) {
      const char = str.charCodeAt(i);
      hash = (hash << 5) - hash + char;
      hash = hash & hash; // Convert to a 32-bit integer
    }
    return hash;
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
        let sim = SequencesimilarityD2stra(s1, s2, k);
        let dist = sim;
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

    // console.log(dist_mat);
    return result;
  }
}

// finf minimum distance
function findMinimum(dist_mat, matrix) {
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
