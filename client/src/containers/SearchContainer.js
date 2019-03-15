import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { reset } from "redux-form";
import { doRatingAdd } from "../redux/actions/ratingActions";
import { doMovieSearchRequesting } from "../redux/actions/movieActions";
import {
  getSearchedMovies,
  getMoviesAsErrors
} from "../redux/selectors/selectors";
import poster from "../assets/no-poster.jpg";
import AppBarContainer from "./AppBarContainer";
import GenreContainer from "./GenreContainer";
import MovieCard from "../components/MovieCard";
import Notifications from "../components/Notifications";
//material-ui
import Grid from "@material-ui/core/Grid";
import GridList from "@material-ui/core/GridList";
import GridListTile from "@material-ui/core/GridListTile";
import ListSubheader from "@material-ui/core/ListSubheader";
import { withStyles } from "@material-ui/core/styles";
import withWidth from "@material-ui/core/withWidth";

const styles = theme => ({
  root: {
    display: "flex",
    flexWrap: "wrap",
    justify: "space-around",
    alignItems: "center",
    margin: theme.spacing.unit * 6
  },
  tile: {
    height: 0,
    padding: "56.25% 0 0 0",
    maxWidth: 500
  }
});

class SearchContainer extends Component {
  constructor(props) {
    super(props);
    this.handleRating = this.handleRating.bind(this);
  }

  // componentDidMount() {
  //   this.props.doMovieSearchRequesting();
  // }

  handleSearch = event => {
    this.props.doMovieSearchRequesting(event);
  };

  handleRating(event) {
    this.props.doRatingAdd(event);
  }

  render() {
    const { classes, width, searchedMovies, movieErrors } = this.props;
    //Provides breakpoints for number of movies per row according to screen size
    const columns = {
      xs: 2,
      sm: 3,
      md: 4,
      lg: 6,
      xl: 8
    };

    let resize = 1;
    let length = Object.keys(searchedMovies).length;
    if (length < 3 && columns[width] >= 3) {
      switch (length) {
        case 1:
        case 2:
          resize = 3;
          break;
      }
    }
    let card = 0;
    let movies = Object.values(searchedMovies).map(movie => {
      let { id, title, overview, poster_path } = movie;
      let imageUrl = poster_path
        ? "https://image.tmdb.org/t/p/w500" + movie.poster_path
        : `${poster}`;
      card += 1;
      return (
        <GridListTile className={classes.tile} key={card} cols={resize}>
          <MovieCard
            movie={movie}
            imageUrl={imageUrl}
            handleRating={this.handleRating}
          />
        </GridListTile>
      );
    });

    return (
      <>
        <div className={classes.root}>
          <Grid container justify="space-between">
            <Grid item>
              <ListSubheader component="div">
                <GenreContainer />
              </ListSubheader>
            </Grid>
            <Grid item>
              <AppBarContainer handleSearch={this.handleSearch} />
            </Grid>
          </Grid>
          <GridList cellHeight="auto" spacing={10} cols={columns[width]}>
            {movies}
          </GridList>
        </div>
        <Notifications>{movieErrors}</Notifications>
      </>
    );
  }
}

const mapStateToProps = (state, props) => ({
  searchedMovies: getSearchedMovies(state),
  movieErrors: getMoviesAsErrors(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    { doMovieSearchRequesting, doRatingAdd, dispatch: reset("search") }
  )(withWidth()(withStyles(styles)(SearchContainer)))
);
