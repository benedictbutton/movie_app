import React, { useState, useEffect } from "react";
import testImage from "../assets/brushed-metal.jpg";
// materrial-ui
import Card from "@material-ui/core/Card";
import CardMedia from "@material-ui/core/CardMedia";
import Grid from "@material-ui/core/Grid";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    flex: 1
  },
  cover: {
    width: 20,
    height: 20
  }
});

const Trailers = props => {
  const { id, classes } = props;

  const [isLoading, setIsLoading] = useState(false);
  const [trailerData, setTrailerData] = useState([]);
  const [isError, setIsError] = useState(false);

  useEffect(() => {
    let fetchData = async () => {
      setIsError(false);
      setIsLoading(true);
      try {
        let response = await fetch(
          `https://api.themoviedb.org/3/movie/${id}/videos?api_key=77d5d44b891ceb6d4b5e717b8e2e9256`,
          {
            method: "GET",
            headers: {
              "Content-Type": "application/json"
              // Authorization: `Bearer ${accessToken}`
            }
          }
        );
        let responseJson = await response.json();
        if (!response.ok) throw new Error(responseJson);
        setTrailerData(responseJson.results);
      } catch (error) {
        setIsError(true);
      }
      setIsLoading(false);
    };
    fetchData();
  }, []);

  let data = trailerData.slice(0, 1);
  let trailers = data.map(trailer => {
    let link = `https://youtube.com/embed/${trailer.key}`;
    return (
      <iframe
        src={link}
        frameBorder="0"
        allow="autoplay; encrypted-media"
        allowFullScreen
        title="video"
      />
    );
  });

  return <div>{trailers}</div>;
};

export default withStyles(styles)(Trailers);
