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
