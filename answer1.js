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

const words = ["is", "valid", "today"];
const variableName = "IsValId";

// const words = ["ea"];
// const variableName = "Ea";

// const words = ["a"];
// const variableName = "AAAAAAAAAAAAAAAAAAAAA";

// const words = ["paxltbm", "hhbut", "ehqn", "odqetasf", "zt"];
// const variableName = "lg";

console.log(camelCase(words, variableName));

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
