// localStorage.js
export const loadState = () => {
  try {
    const serializedState = localStorage.getItem("state");
    if (serializedState === null) {
      console.log("test");
      return undefined;
    }
    return JSON.parse(serializedState);
  } catch (err) {
    return undefined;
  }
};

export const saveState = state => {
  console.log(state);
  try {
    const serializedState = JSON.stringify(state);
    console.log(state);
    localStorage.setItem("state", serializedState);
  } catch {
    //ignore write errors
  }
};
