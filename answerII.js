const addToKey = obj => {
  const renameProp = (oldProp, newProp, { [oldProp]: old, ...others }) => {
    console.log(newProp);
    return {
      [newProp]: old,
      ...others
    };
  };

  for (let key in obj) {
    let newProp = key + key;
    renameProp(key, newProp, obj);
  }
  return obj;
};

//   let keys = Object.keys(obj);
//   obj = keys.map(key => {
//     let value = obj[key];
//     let prop = key + key;
//     return {
//       [prop]: value
//     };
//   }, {});
//   return obj;
// };

const obj = { a: 1, b: 2, c: 3 };

console.log(addToKey(obj));
