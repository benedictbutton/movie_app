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

const subStringF = (string, k) => {
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

  let set = {};
  for (let char of string) set[char] = set[char] + 1 || 1;

  let kValues = {};
  let idxes = [];
  for (let idx in string) {
    if (set[string[idx]] === 1) {
      kValues[idx] = string[idx];
      idxes.push(idx);
    }
  }

  let kCount = 0;
  let limit = Math.floor(string.length / 2);
  let results = [];
  for (let start = 0; start < limit - 1; start++) {
    let i = start;
    let j = limit;
    let q = limit + 1;
    let t = string.length - 1;
    const idxesCopy = [...idxes];
    let s1 = "";
    let s2 = "";
    let differences = 0;
    while (differences < k * 2 && i < limit) {
      if (string[i] === string[q]) {
        s1 += string[i];
        s2 += string[q];
        i++;
        q++;
      } else {
        s1 += string[i];
        s2 += string[q];
        i++;
        q++;
        differences += 2;
      }
    }
    results.push(s1 + "///" + s2);
  }
  return results;
};
// !!!!!!!!differ at their k character!!!!!!!!!
let string = "abacaba";
let k = 1;

console.log(subStringF(string, k));
