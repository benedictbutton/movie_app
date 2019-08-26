import { useState } from "react";

const useForgot = callback => {
  const [input, setInput] = useState({});

  const handleChange = event => {
    event.persist();
    setInput(input => ({
      ...input,
      [event.target.name]: event.target.value
    }));
  };

  const handleForgot = event => {
    event.preventDefault();
    callback();
  };

  return {
    handleForgot,
    handleChange,
    input
  };
};

export { useForgot };
