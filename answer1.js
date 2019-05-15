function camelCase(words, variableName) {
  let array = variableName.split("");

  let matches = [];
  array.map((el, idx) => {
    if (el === el.toUpperCase()) matches.push(idx);
  });

  let collectWords = [];
  // first conditional deals with no capitals
  if (matches.length === 0) collectWords.push(variableName);
  else {
    // i >= 0 ensures index zero is processed
    for (let i = matches.length - 1; i >= 0; i--) {
      let word = variableName.slice(matches[i]);
      collectWords.push(word);
      variableName = variableName.slice(0, matches[i]);
      // to handle last word if first letter is not capitalized
      if (i === 0 && matches[0] !== 0) {
        collectWords.push(variableName);
        break;
      }
    }
  }
  console.log(collectWords);
  for (let i = 0; i < collectWords.length; i++) {
    // first make sure word is in approved words array
    if (!words.includes(collectWords[i].toLowerCase())) return false;
  }
  return true;
}
//
// const words = ["is", "valid", "today"];
// const variableName = "IsValId";
//
// console.log(camelCase(words, variableName));

///////////////////////////////////////////////////////

function mergeStrings(s1, s2) {
  let result = "";
  const array1 = s1.split("");
  const array2 = s2.split("");

  const set1 = {};
  const set2 = {};

  array1.map(el => {
    if (!set1[el]) return (set1[el] = 1);
    else return (set1[el] = set1[el] + 1);
  });
  array2.map(el => {
    if (!set2[el]) return (set2[el] = 1);
    else return (set2[el] = set2[el] + 1);
  });

  let i = 0;
  let j = 0;
  while (i < array1.length && j < array2.length) {
    if (set1[array1[i]] < set2[array2[j]]) {
      result += array1[i];
      i++;
    } else if (set1[array1[i]] > set2[array2[j]]) {
      result += array2[j];
      j++;
    } else if (set1[array1[i]] === set2[array2[j]] && array1[i] < array2[j]) {
      result += array1[i];
      i++;
    } else if (set1[array1[i]] === set2[array2[j]] && array1[i] > array2[j]) {
      result += array2[j];
      j++;
    } else {
      result += array1[i];
      i++;
    }
  }

  if (i < array1.length) result += array1.join("").slice(i, array1.length);
  if (j < array2.length) result += array2.join("").slice(j, array2.length);

  return result;
}

///////////////////////////////////////////////////////

function upToKDifferences(str, k) {
  let obj = [];
  const result = [];

  const array = str.split("");
  let s = "";
  for (let i = 0; i < array.length; i++) {
    if (!obj.includes(array[i]) && obj.length + 1 > k) {
      obj = [];
      obj.push(array[i]);
      result.push(s);
      if (i + 1 === array.length) {
        result.push(array[i]);
        break;
      }
      s = "";
      s += array[i];
      continue;
    }
    if (i + 1 === array.length) {
      s += array[i];
      result.push(s);
      continue;
    }
    if (obj.includes(array[i])) {
      s += array[i];
      continue;
    } else {
      obj.push(array[i]);
      s += array[i];
    }
  }
  return result.length;
}

///////////////////////////////////////////////////////

function alternatingSort(a) {
  const b = [];

  let i = 0;
  let k = 0;
  let l = 1;
  let len = a.length;

  while (i < len) {
    if (i % 2 === 0) {
      b[i] = a[k];
      k++;
      i++;
    } else {
      b[i] = a[a.length - l];
      l++;
      i++;
    }
  }

  return b.every((el, idx) => {
    return el < b[idx + 1] || b[idx + 1] === undefined;
  });
}

///////////////////////////////////////////////////////

function meanGroups(a) {
  let means = [];
  for (let i = 0; i < a.length; i++) {
    let sum = a[i].reduce((acc, curr, intialValue = 0) => acc + curr);
    let mean = sum / a[i].length;
    means.push(mean);
  }

  let results = [];
  let checked = [];
  for (let i = 0; i < means.length; i++) {
    let result = [];
    if (checked.includes(means[i])) continue;
    checked.push(means[i]);
    result.push(i);
    for (let j = i + 1; j < means.length; j++) {
      if (means[j] === means[i]) result.push(j);
    }
    results.push(result);
  }
  return results;
}

///////////////////////////////////////////////////////

function countTinyPairs(a, b, k) {
  let count = 0;
  for (let i = 0, j = b.length - 1; i < a.length; i++, j--) {
    let string = a[i].toString() + b[j].toString();
    console.log(a[i] + b[j]);
    if (parseInt(string, 10) < k) count++;
  }
  return count;
}

///////////////////////////////////////////////////////

// const subStri  ngF = (string, k) => {
// const set1 = {};
// const set2 = {};
// const kValues = {};
// i = 0, j = k+1;
// q = k+2, t = sting.length;
// k = 1
// a b a c a b a
//
// a
//
// let i = 0;
// let j = k+1;
// let q = k + 2;
// let t = string.length;

// i = 0 ===== j = limit;
//
// q=limit+1 ===== t=length-1
//
// i=0
// q=limit+1

//   let set = {};
//   for (let char of string) set[char] = set[char] + 1 || 1;
//
//   let kValues = {};
//   let idxes = [];
//   for (let idx in string) {
//     if (set[string[idx]] === 1) {
//       kValues[idx] = string[idx];
//       idxes.push(idx);
//     }
//   }
//
//   let kCount = 0;
//   let limit = Math.floor(string.length / 2);
//   let results = [];
//   for (let start = 0; start < limit - 1; start++) {
//     let i = start;
//     let j = limit;
//     let q = limit + 1;
//     let t = string.length - 1;
//     const idxesCopy = [...idxes];
//     let s1 = "";
//     let s2 = "";
//     let differences = 0;
//     while (differences < k * 2 && i < limit) {
//       if (string[i] === string[q]) {
//         s1 += string[i];
//         s2 += string[q];
//         i++;
//         q++;
//       } else {
//         s1 += string[i];
//         s2 += string[q];
//         i++;
//         q++;
//         differences += 2;
//       }
//     }
//     results.push(s1 + "///" + s2);
//   }
//   return results;
// };
// !!!!!!!!differ at their k character!!!!!!!!!

// function substringPairs(s, k) {
//
//     if (k === 0) return null;
//
//     let i = 0;
//     let q = k+1;
//     let t = s.length;
//     let limit = Math.floor(s.length / 2);
//
//     const addLetters (x, y, k, s) => {
//         let s1 = '';
//          while (s[x] === s[y] && i !== k) {
//             s1 += s[x];
//             x+=1;
//             y+=1;
//         }
//         return s1;
//     }
//
//
//     let s1 = '';
//     let s2 = '';
//     let s3 = '';
//     let results = [];
//     for(let i=0, q=k+2; i <= (k+1); i++, q++) {
//         s1 = '';
//         s2 = '';
//         s3 = '';
//         if (s[i] !=== s[q]) continue;
//         let string = addLetters(i, q, k, s);
//         if (string.length > 1) {
//             s1 += string;
//             s2 += string;
//         }
//         let lenny = string.length;
//         if (string.length === k && s[lenny] !== s[lenny]) {
//             s1 += s[lenny];
//             s2 += s[lenny];
//             s3 = s1 + '///' + s2;
//             results.push(s3);
//         }
//
//     }
//
//     console.log(results);
//
// }
// function substringPairs(s, k) {
//
//     if (k === 0) return null;
//
//     let i = 0;
//     let q = k+1;
//     let t = s.length;
//     let limit = Math.floor(s.length / 2);
//
//     const addLetters (x, y, k, s, s1) => {
//          while (s[x] === s[y] && i !== k) {
//             s1 += s[x];
//             x+=1;
//             y+=1;
//         }
//         let lenny = s1.length-1;
//         if (s1.length-1 === k && s[lenny] !== s[lenny]) {
//             s1 += s[lenny];
//             addLetters(x, y, k, s, s1)
//         }
//         return s1;
//     }
//
//
//     let s1 = '';
//     let s2 = '';
//     let s3 = '';
//     let results = [];
//     for(let i=0, q=k+2; i <= (k+1); i++, q++) {
//         s1 = '';
//         s2 = '';
//         s3 = '';
//         if (s[i] !=== s[q]) continue;
//         let string = addLetters(i, q, k, s);
//         if (string.length > 1) {
//             s1 += string;
//             s2 += string;
//         }
//         let lenny = string.length;
//
//
//     }
//
//     console.log(results);
//
// }

// function substringF(s, k) {
//   let result = [];
//   const addLetters = (x, y, k, s, str) => {
//     while (s[x] === s[y]) {
//       str += s[x];
//       x++;
//       y++;
//     }
//
//     if (x === k && s[x] !== s[y]) {
//       str += s[x];
//       console.log(str);
//       result.push(str);
//       return addLetters(x + 1, y + 1, k, s, str);
//     }
//     return result;
//   };
//
//   let i = 0;
//   let j = k + 1;
//   let q = k + 2;
//   let t = s.length - 1;
//   let limit = t - k;
//   console.log(limit);
//   let results = [];
//   for (let i = 0, q = k + 1; q !== limit; i++, q++) {
//     let str = "";
//     if (s[i] !== s[q]) continue;
//     else {
//       let result = addLetters(i, q, k, s, str);
//       results.push(result);
//     }
//     console.log(result);
//   }
//   return results;
// }
//   let results = [];
//   let str = "";
//   let str1 = "";
//   for (let i = 0, j = 1; i < s.length; i++, j++) {
//     if (s[i] !== s[k + j] && str.length === 0) continue;
//     if (i !== k && s[i] === s[k + j]) {
//       str += s[i];
//       str1 += s[k + j];
//     }
//
//     if (i === k && s[i] !== s[k + j]) {
//       str += s[i];
//       str1 += s[k + j];
//     }
//
//     if (str.length >= k + 1 && !results.includes(str + "///" + str1)) {
//       i -= str.length;
//       j -= str.length;
//       str = str + "///" + str1;
//       results.push(str);
//       str = "";
//       str1 = "";
//       continue;
//     }
//   }
//   return results;
// }

function substringPairs(s, k) {
  let reults = [];

  let i = 0;
  let q = k + 1;
  let j = k + 2;
  let t = s.length - 1;

  let s1 = "";
  let s2 = "";
  const set1 = [];
  const set2 = [];
  let count = 0;

  for (; j < s.length - k && i !== j; i++) {
    console.log(i);
    if (s[i] !== s[j]) continue;

    let x = i;
    let y = j;

    const addLetters = () => {
      while (s[x] === s[y]) {
        s1 += s[x];
        s2 += s[y];
        x++;
        y++;
      }
    };
    console.log(x + "+++" + y + s1);
    addLetters();
    console.log(x + "..." + y + s2);
    if (x === k && s[x] !== s[y]) {
      s1 += s[x];
      s2 += s[y];
      x++;
      y++;
    }

    if (s1.length > k && (!set1.includes(s1) || !set2.includes(s2))) {
      set1.push(s1);
      set2.push(s2);
      j--;
      i--;
      continue;
    }

    if (s[x] === s[y]) addLetters();
  }
  console.log(set1 + "///" + set2);
}

// k+1, half;
//
// 0 to k+1; k+2 to end
// 1 to k+2; k+3 to end
// 2 to k+3; k+4 to end;
//

// a/0      a/2
// ab

// *** set key to s1 and value to s2 !!!

min is F, which is 5

F attached to B by 3



let string = "abacaba";
let k = 1;

// let string = "doqzcmbcpzrzepz";
// let k = 6;
console.log(substringPairs(string, k));
