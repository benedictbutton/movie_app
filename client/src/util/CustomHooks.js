import { useState, useEffect } from "react";

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

const useMultiApi = (multiApiUrl, multiApiHeader) => {
  const [ids, setIds] = useState([]);
  const [multiHeader, setMultiHeader] = useState(multiApiHeader);
  const [multiUrl, setMultiUrl] = useState(multiApiUrl);
  const [multiApiData, setMultiApiData] = useState();
  const [isMultiLoading, setIsMultiLoading] = useState(false);
  const [isMultiError, setIsMultiError] = useState(false);

  const promises = ids.map(id => {
    return fetch(
      `${multiUrl}/${id}?api_key=77d5d44b891ceb6d4b5e717b8e2e9256&language=en-US`,
      multiHeader
    );
  });

  useEffect(() => {
    if (multiUrl === "") return;
    const fetchData = async () => {
      setIsMultiError(false);
      setIsMultiLoading(true);
      try {
        const results = await Promise.all(promises);

        const data = await Promise.all(
          results.map(r => {
            if (r) return r.json();
          })
        );
        setMultiApiData(data);
      } catch (error) {
        setIsMultiError(true);
        return { error };
      }
      setIsMultiLoading(false);
      return multiApiData;
    };
    fetchData();
    setMultiUrl("");
  }, [multiApiData, multiApiUrl, multiHeader, multiUrl, promises]);

  return [
    { multiApiData, isMultiLoading, isMultiError },
    setMultiUrl,
    setMultiHeader,
    setMultiApiData,
    setIds
  ];
};

const useApi = (apiUrl, apiHeader) => {
  const [header, setHeader] = useState(apiHeader);
  const [url, setUrl] = useState(apiUrl);
  const [apiData, setApiData] = useState();
  const [isLoading, setIsLoading] = useState(false);
  const [isError, setIsError] = useState(false);

  // setUrl(
  //   `https://www.dictionaryapi.com/api/v3/references/collegiate/json/${query}?key=${process.env.DICTIIONARY_API}`,
  // );

  useEffect(() => {
    if (url === "") return;
    const fetchData = async () => {
      setIsError(false);
      setIsLoading(true);
      try {
        const response = await fetch(url, header);
        if (!response.ok) throw response.status;
        const responseJson = await response.json();
        setApiData(responseJson);
        console.log(responseJson);
      } catch (error) {
        setIsError(true);
      }
      setIsLoading(false);
      return apiData;
    };
    fetchData();
    setUrl("");
  }, [apiData, apiUrl, header, url]);

  return [{ apiData, isLoading, isError }, setUrl, setHeader, setApiData];
};

export { useForgot, useMultiApi, useApi };
