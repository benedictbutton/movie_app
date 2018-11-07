// async function fetchMovies(query) {
//   try {
//     let response = await fetch(
//       "https://api.themoviedb.org/4/list/1?api_key=77d5d44b891ceb6d4b5e717b8e2e9256",
//       {
//         method: "GET",
//         headers: {
//           "Content-Type": "application/json"
//         }
//       }
//     );
//     let responseJson = await response.json();
//     console.log(responseJson);
//     return responseJson;
//   } catch (error) {
//     console.log(error);
//   }
// }
//
// export { fetchMovies };

const header = {
  method: "GET",
  headers: {
    "Content-Type": "application/json"
  }
};

async function fetchMovies(query) {
  let ids = [1, 2, 3];
  const promises = ids.map(id => {
    return fetch(
      `https://api.themoviedb.org/4/list/${id}?api_key=77d5d44b891ceb6d4b5e717b8e2e9256`,
      header
    );
  });

  const results = await Promise.all(promises);
  const data = await Promise.all(results.map(r => r.json()));

  return data;
}

export { fetchMovies };
// async function getDogs(breeds) {
//     const promises = breeds.map((breed) => {
//         return fetch(`https://dog.ceo/api/breed/${breed}/images/random`);
//     });
//
//     const results = await Promise.all(promises);
//     const data = await Promise.all(results.map(r => r.json()));
//     console.log(data);
// }
// getDogs(['husky', 'malamute', 'terrier']);
//

//
//   try {
//     let firstAddress = fetchUrl(id[0]);
//     let firstResponse = async () => fetch(firstAddress, header);
//
//     let secondAddress = fetchUrl(id[1]);
//     let secondResponse = async () => fetch(secondAddress, header);
//
//     let thirdAddress = fetchUrl(id[2]);
//     let thirdResponse = async () => fetch(thirdAddress, header);
//
//     let responses = await Promise.all([
//       firstResponse(),
//       secondResponse(),
//       thirdResponse()
//     ]);
//
//     let result = responses.map(r => r.json());
//     return responses;
//   } catch (error) {
//     console.log(error);
//   }
// }
//
// export { fetchMovies };
//
// // async function makePizza(sauceType = "red") {
// //   let prepareDough = memoize(async () => makeDough());
// //   let prepareSauce = memoize(async () => makeSauce(sauceType));
// //   let prepareCheese = memoize(async () => {
// //     return grateCheese((await prepareSauce()).determineCheese());
// //   });
// //
// //   let [dough, sauce, cheese] = await Promise.all([
// //     prepareDough(),
// //     prepareSauce(),
// //     prepareCheese()
// //   ]);
// //
// //   dough.add(sauce);
// //   dough.add(cheese);
// //
// //   return dough;
// // }
