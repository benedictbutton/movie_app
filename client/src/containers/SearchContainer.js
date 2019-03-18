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
import CategorySearchContainer from "./CategorySearchContainer";
import GenreContainer from "./GenreContainer";
import MovieCard from "../components/MovieCard";
import Notifications from "../components/Notifications";
//material-ui
import AppBar from "@material-ui/core/AppBar";
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
    marginTop: theme.spacing.unit * 2,
    margin: theme.spacing.unit * 6
  },
  bar: {
    background: "transparent",
    position: "relative"
  },
  genre: {
    paddingTop: 0,
    paddingBottom: 0
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
    this.state = {
      display: false,
      search: false
    };
    this.handleRating = this.handleRating.bind(this);
  }

  // componentDidMount() {
  //   this.props.doMovieSearchRequesting();
  // }

  // handleSearch = event => {
  //   this.props.doMovieSearchRequesting(event);
  // };

  handleRating(event) {
    this.props.doRatingAdd(event);
  }

  handleSearch = event => {
    this.setState(prevState => {
      return { ...this.state.search, search: true };
    });
    this.props.doMovieSearchRequesting(event);
    this.props.history.push("search");
  };

  handleSelect = event => {
    event.target.value === "genre"
      ? this.setState({ display: true })
      : this.setState({ display: false });
  };

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
        : movie.profile_path
        ? "https://image.tmdb.org/t/p/w500" + movie.profile_path
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
          <AppBar className={classes.bar}>
            <Grid container justify="space-between" alignItems="flex-start">
              <Grid item>
                <Grid container justify="flex-start">
                  <Grid item>
                    <ListSubheader component="div">
                      <CategorySearchContainer
                        handleSelect={this.handleSelect}
                      />
                    </ListSubheader>
                  </Grid>
                  <Grid item>
                    {this.state.display ? (
                      <ListSubheader component="div">
                        <GenreContainer />
                      </ListSubheader>
                    ) : null}
                  </Grid>
                </Grid>
              </Grid>
              <Grid item>
                <AppBarContainer handleSearch={this.handleSearch} />
              </Grid>
            </Grid>
          </AppBar>
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
