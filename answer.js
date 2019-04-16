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
//       // ***array of arrays should equal subStr.lengt***
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

function camelCaseSeparation(words, variableName) {
  const variableArray = variableName.split("");
  let idxes = [];
  for (let i = 0; i < variableArray.length; i++) {
    if (variableArray[i] === variableArray[i].toUpperCase()) idxes.push(i);
  }

  return idxes;
}

const words = ["is", "valid", "right"];
const variableName = "isValid";

console.log(camelCaseSeparation(words, variableName));
