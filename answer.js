/* AppBar */
// <AppBar position="static" className={classes.appBar}>
// <Toolbar variant="dense">
// <Typography variant="h6" color="inherit" noWrap>
// </Typography>
// </Toolbar>
// </AppBar>

// var jq = document.createElement("script");
// jq.src = "https://code.jquery.com/jquery-3.1.1.min.js";
// jq.onload = function() {
//   jQuery.noConflict();
// };
//
// function detectSelector(node) {
//   let getTag = node =>
//     $(node)
//       .prop("tagName")
//       .toLowerCase();
//
//   let idFormat = nodeId => {
//     let regX = /[!"#$%&'()*+,.\/:;<=>?@[\]^`{|}~]/;
//     let newNodeId = "";
//     let string = $(nodeId).attr("id");
//
//     let format = str => {
//       console.log(str);
//       console.log(regX);
//       let match = str.search(regX);
//       newNodeId = newNodeId + str.slice(0, match) + "//" + str[match];
//       let back = str.slice(match + 1);
//       return back;
//     };
//
//     while (regX.test(string)) {
//       string = format(string);
//     }
//
//     let tag = getTag(nodeId);
//     newNodeId = newNodeId + string;
//
//     return tag + "#" + newNodeId;
//   };
//
//   let classFormat = node => {
//     let newNode = "";
//     let className = "." + $(node).attr("class");
//     let regX = /\s/;
//     if (regX.test(className)) {
//       className = className.replace(regX, ".");
//       newNode = className;
//     }
//     let tag = getTag(node);
//     newNode = tag + newNode;
//     let parent = $(node)
//       .parent()
//       .prop("tagName")
//       .toLowerCase();
//     let n;
//     if ($(tag).length > 1) {
//       let array = $(tag);
//       n = array.index(node);
//     }
//     return `${parent}:nth-type-of(${n}) ${newNode}`;
//   };
//   if ($(node).attr("id")) idFormat(node);
//   else classFormat(node);
// }
// && result.length !== 0

// function difference(str, k) {
//   const testSubStr = (array, limit) => {
//     array = array.split("");
//     let newStrArr = [];
//     let brkPt = array.length;
//     while (newStrArr.length !== brkPt) {
//       let x = array.filter(letter => array[0] !== letter);
//       newStrArr.push(x);
//     }
//     if (newStrArr.length < k) return false;
//     return true;
//   };
//
//   let result = [];
//   str = str.split("");
//   let idx = 1;
//   while (str.length > 0) {
//     let stop = false;
//     let idx = 0;
//     let subStr = "";
//     while (!stop) {
//       const letter = str.shift();
//       idx++;
//       subStr += letter;
//       // find how many of each letter type in subString
//       // ***array of arrays should equal subStr.length***
//       console.log("subStr is:  " + subStr);
//       stop = testSubStr(subStr, k);
//     }
//
//     result.push(subStr);
//     // str = str.slice(idx);
//   }
//   return result;
// }
//
// console.log(difference("aacddddaccbc", 3));

// function camelCaseSeparation(words, variableName) {
//   const variableArray = variableName.split("");
//   let idxes = [];
//   for (let i = 0; i < variableArray.length; i++) {
//     if (variableArray[i] === variableArray[i].toUpperCase()) idxes.push(i);
//   }
//
//   return idxes;
// }
//
// const words = ["is", "valid", "right"];
// const variableName = "isValid";
//
// console.log(camelCaseSeparation(words, variableName));

// let array = [27, 10, 12, 25, 34, 16, 15, 31];
//
// const partition = (array, left, right) => {
//   let i = left;
//   let j = right;
//   let pivot = array[Math.floor((i + j) / 2)];
//
//   while (i <= j) {
//     while (array[i] < pivot) i++;
//     while (array[j] > pivot) j--;
//     if (i <= j) {
//       [array[i], array[j]] = [array[j], array[i]];
//       i++;
//       j--;
//     }
//   }
//   return i;
// };
//
// const quick = (array, left, right) => {
//   if (array.length > 1) {
//     index = partition(array, left, right);
//     if (left < index - 1) quick(array, left, index - 1);
//     if (index < right) quick(array, index, right);
//   }
//   return array;
// };
//
// const quickSort = array => quick(array, 0, array.length - 1);
// console.log(quickSort(array));

// Expected Output:
// 160000016000000

function substringPairs(s, k) {
  let set = {};

  // for (let i = 0; i < s.length; i++) {
  for (let i = 0, j = k + 1; j < s.length - k; j++) {
    console.log("j is: " + j);
    if (s[i] !== s[j]) continue;
    let x = i;
    let y = j;
    let s1 = "";
    let s2 = "";

    const addLetters = () => {
      console.log("test is: " + s1);
      while (x !== k && s[x] === s[y]) {
        s1 += s[x];
        s2 += s[y];
        console.log(y);
        x++;
        y++;
      }
      console.log(s2 + "???" + s1);
    };
    console.log("x is: " + x);
    addLetters();
    console.log("x: " + x);
    if (x === k) {
      console.log("set is: " + set);
      s1 += s[x];
      s2 += s[y];
      if (set[s1] && s[x + 1] === s[y + 1]) {
        console.log("2nd time around");
        x++;
        y++;
        addLetters();
      } else {
        set[s1] = s2;
        j--;
      }
    }
    console.log(s1 + "-----" + s2);
    if (!set[s1] && s1.length > k) set[s1] = s2;
  }
  console.log(set);
}
// }
let string = "abacaba";
let k = 1;

// let string = "doqzcmbcpzrzepz";
// let k = 6;

console.log(substringPairs(string, k));


function hashMap(queryType, query) {
    hash = {};
    let count = 0;
    
    const insert = (x, y) => {
        hash[x] = y;
    }

    const get = (x, count) => {
         count += hash[x];
    }

    const addToKey = (oldProp, newProp, { [oldProp]: old, ...others }) => {
        return {
          [newProp]: old,
          ...others
    };
  };

    }

    const addToValue = (obj, y) => {
        for (let key in obj) {
            obj[key] = obj[key] + y;
        }
    }

    let len = query.length;

    for (let i = 0; i < len; i++) {
        if (queryType === 'insert') {
            insert(query[i]);
            continue;
        }
        if (queryType === 'get') {
            get(query[i]);
            continue;
        }
        if (queryType === 'addToKey') {
            for (let key in hash) {
                let old = hash[key]
                let newProp = key+query[i][0];
                addToKey(key,newProp, { [key]: old, ...others } )
            }
            continue;
        }
        if (queryType === 'addToValue') {
            addToKey(hash, query[i]);
            continue;
        }

    }
    return count;
}
