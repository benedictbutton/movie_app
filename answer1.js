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
    result = '';
    const set1 = {};
    const set2 = {};

    for (char of s1) {
        set1[char] = set1[char] + 1 || 1;
    }

    for (char of s2) {
        set2[char] = set2[char] + 1 || 1;
    }

    let i = 0;
    let j = 0;

    while (i < s1.length && j < s2.length) {
        if (set1[s1[i]] < set2[s2[j]]) {
            result += s1[i];
            i++;
        } else if (set1[s1[i]] > set2[s2[j]]) {
            result += s2[j];
            j++
        } else if ((set1[s1[i]] === set2[s2[j]]) && s1[i] < s2[j]) {
            result += s1[i];
            i++;
        } else if ((set1[s1[i]] === set2[s2[j]]) && s1[i] > s2[j]) {
            result += s2[j];
            j++;
        } else {
            result += s1[i];
            i++;
        }
    }

    if (i < s1.length) result += s1.slice(i, s1.length);
    if (j < s2.length) result += s2.slice(j, s2.length);

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
    if (parseInt(string, 10) < k) count++;
  }
  return count;
}

///////////////////////////////////////////////////////

// Needs optimization
function concatenationsSum(a) {
    let array = [];
    for (let i = 0; i < a.length; i++) {
        for (let j=0; j < a.length; j++) {
         array.push(a[i].toString() + a[j].toString());
        }
    }
    let sum = array.reduce((acc, curr, intialValue=0) => parseInt(acc, 10) + parseInt(curr, 10));

    return parseInt(sum, 10);
}

///////////////////////////////////////////////////////

function mutateTheArray(n, a) {
    b = [];

    if (a.length === 1) return a;

    for (let i = 0; i < a.length; i++) {
       if (i === 0) b[i] = a[i] + a[i+1];
       else if (i === a.length-1) b[i] = a[i-1] + a[i];
       else b[i] = a[i-1] + a[i] + a[i+1];
    }
    return b;
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
  let q = k + 1; // 2
  let j = k + 1; // 2
  let t = s.length - 1;

  let s1 = "";
  let s2 = "";
  const set1 = [];
  const set2 = [];
  let count = 0;

  // ("ab ac ab a");
  for (; j <= s.length - k; i++, j++) {
    let k = i;
    let x = i;
    let y = j;
    while (i !== j) {
      console.log(i);
      if (s[x] !== s[y]) break;
      console.log(i);

      const addLetters = () => {
        console.log("test");
        while (s[x] === s[y]) {
          s1 += s[x];
          s2 += s[y];
          x++;
          y++;
        }
      };
      // console.log(x + "+++" + y + s1);
      addLetters();
      // console.log(x + "..." + y + s2);
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
      i++;
    }
    i = k;
  }
  console.log(set1 + "///" + set2);
}

// function substringPairs(s, k) {
//   let reults = [];
//
//   let i = 0;
//   let q = k + 1;
//   let j = k + 2;
//   let t = s.length - 1;
//
//   let s1 = "";
//   let s2 = "";
//   const set1 = [];
//   const set2 = [];
//   let count = 0;
//
//   for (; j < s.length - k && i !== j; i++) {
//     console.log(i);
//     if (s[i] !== s[j]) continue;
//
//     let x = i;
//     let y = j;
//
//     const addLetters = () => {
//       while (s[x] === s[y]) {
//         s1 += s[x];
//         s2 += s[y];
//         x++;
//         y++;
//       }
//     };
//     console.log(x + "+++" + y + s1);
//     addLetters();
//     console.log(x + "..." + y + s2);
//     if (x === k && s[x] !== s[y]) {
//       s1 += s[x];
//       s2 += s[y];
//       x++;
//       y++;
//     }
//
//     if (s1.length > k && (!set1.includes(s1) || !set2.includes(s2))) {
//       set1.push(s1);
//       set2.push(s2);
//       j--;
//       i--;
//       continue;
//     }
//
//     if (s[x] === s[y]) addLetters();
//   }
//   console.log(set1 + "///" + set2);
// }


// k+1, half;
//
// 0 to k+1; k+2 to end
// 1 to k+2; k+3 to end
// 2 to k+3; k+4 to end;
//

// a/0      a/2
// ab

// *** set key to s1 and value to s2 !!!

// min is F, which is 5


// F attached to B by 3

//
// F attached to B by 3

// let string = "doqzcmbcpzrzepz";
// let k = 6;

function substringPairs(s, k) {
  let set = {};

  for (let i = 0, j = k + 1; j < s.length - k; i++, j++) {
    let s1 = "";
    let s2 = "";
    let z = 0;

    if (s.length <= k + 1) return 0;
    let x = i;
    let y = j;

    const addLetter = () => {
      while ((s[x] === s[y] || x - i === k) && s1.length < k + z) {
        s1 += s[x];
        s2 += s[y];
        x++;
        y++;
      }
      console.log("s1: " + s1 + "///" + " s2: " + s2);
      if (s1.length > k) set[s1] = s2;
    };

    while (z < Math.floor(s.length / 2)) {
      addLetter();
      z++;
    }
  }
  console.log(set);
  return set;

  // let result = Object.values(set).length;
  // return result * 4;
}

let string = "acbbcbbaabcccbabcabb";
let k = 3;
// answer is 4
// let string = "abacaba";
// let k = 1;


let string = "doqzcmbcpzrzepz";
let k = 6;
console.log(substringPairs(string, k));



"abacaba"


let i = 0;
let j = k+1;
A B
A C A B A

doqzcmbcpzrzepz
D O Q Z C M B C P Z R Z E P Z

add to i by adding to k, but don't increment i;
then add to i by subtracting from end, so 2 for loops;
s.length -k ensures j is at least k length;

y // are i and j  = (s1 = A; s2 = A)
y // i is k (s1 = AB; s2 = AC)
add to set; restart;
second time around // set includes (s1 = AB; s2 = AC) so go back to while
y // are i and j = (s1 = ABA, s2 = ACA) note i and j overlap;
n // i !== j (do not add to strings, set) and break for new course



}

adding 1 to i
adding 1 to j
