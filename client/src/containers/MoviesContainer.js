import React, { Component } from "react";
import { connect } from "react-redux";
// import { getMovies } from "../redux/selectors/movies";
import { doAddMovies } from "../redux/actions/movieActions";
import { denormalize, schema } from "normalizr";
import { withRouter } from "react-router-dom";
import MovieCard from "../components/MovieCard";
import { movieSchema } from "../redux/schemas/schema";
//material-ui
import Button from "@material-ui/core/Button";
import Grid from "@material-ui/core/Grid";
import GridList from "@material-ui/core/GridList";
import GridListTile from "@material-ui/core/GridListTile";
import { withStyles } from "@material-ui/core/styles";
import withWidth from "@material-ui/core/withWidth";

const styles = theme => ({
  root: {
    display: "flex",
    flexWrap: "wrap",
    justifyContent: "space-around",
    margin: theme.spacing.unit * 6
  },
  footer: {
    backgroundColor: theme.palette.background.paper,
    padding: theme.spacing.unit * 6
  },
  subheader: {
    width: "100%"
  },
  tile: {
    height: "0",
    padding: "56.25% 0 0 0"
  }
});

class MoviesContainer extends Component {
  componentDidMount() {
    this.props.dispatch(doAddMovies());
  }
  render() {
    const { classes, width } = this.props;
    const columns = {
      sm: 2,
      md: 4,
      lg: 6
    };

    let card = 0;

    let movies = Object.values(this.props.movies).map(movie => {
      console.log(movie);
      let { id, title, overview } = movie;
      let imageUrl = "https://image.tmdb.org/t/p/w500" + movie.poster_path;
      card += 1;
      return (
        <GridListTile className={classes.tile} key={card} cols={1}>
          <MovieCard
            key={card}
            id={id}
            imageUrl={imageUrl}
            title={title}
            overview={overview}
          />
        </GridListTile>
      );
    });

    return (
      <>
        <div className={classes.heroButtons}>
          <Grid container spacing={16} justify="center">
            <Grid item>
              <Button variant="contained" color="primary">
                Exisitng Playlists
              </Button>
            </Grid>
            <Grid item>
              <Button variant="outlined" color="primary">
                Create Playlist
              </Button>
            </Grid>
          </Grid>
        </div>
        <div className={classes.root}>
          <GridList cellHeight="auto" spacing={10} cols={columns[width]}>
            {movies}
          </GridList>
        </div>
      </>
    );
  }
}

const mapStateToProps = state => ({
  movies: state.movies
});

export default withRouter(
  connect(
    mapStateToProps,
    null
  )(withWidth()(withStyles(styles)(MoviesContainer)))
);
