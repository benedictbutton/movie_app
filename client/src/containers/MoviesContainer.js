import React, { Component } from "react";
import { Redirect, withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { doRatingAdd } from "../redux/actions/ratingActions";
import {
  doMoviesRequesting,
  doMovieSearchRequesting,
  doUpdateGenre
} from "../redux/actions/movieActions";
import {
  getClientNotifications,
  getMovies,
  getRatings,
  getMoviesAsErrors
} from "../redux/selectors/selectors";
import AppBarContainer from "./AppBarContainer";
import CategorySearchContainer from "./CategorySearchContainer";
import GenreContainer from "./GenreContainer";
import MovieCard from "../components/MovieCard";
import Notifications from "../components/Notifications";
// material-ui
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
    height: "0",
    paddingTop: "56.25%"
  }
});

class MoviesContainer extends Component {
  state = {
    display: false,
    search: false
  };
  componentDidMount() {
    window.addEventListener("scroll", this.onScroll, false);
    this.props.doMoviesRequesting(this.props.movies.query);
  }

  componentWillUnmount() {
    window.removeEventListener("scroll", this.onScroll, false);
  }

  onScroll = () => {
    if (
      window.innerHeight + window.scrollY >= document.body.offsetHeight - 500 &&
      this.props.movies.results.length &&
      !this.props.movies.requesting
    ) {
      let payload = {
        page: this.props.movies.query.page + 1,
        genre: this.props.movies.query.genre
      };
      this.props.doMoviesRequesting(payload);
    }
  };

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
    // if (this.state.search) return <Redirect to="/ms/search" />;

    const { classes, width, clientNotifications, movieErrors } = this.props;
    //Provides breakpoints for number of movies per row according to screen size
    const columns = {
      xs: 2,
      sm: 3,
      md: 4,
      lg: 6,
      xl: 8
    };

    let card = 0;
    let movies = this.props.movies.results.map(index => {
      let movie = this.props.movies.list[index];
      let imageUrl = "https://image.tmdb.org/t/p/w500" + movie.poster_path;
      card += 1;
      return (
        <GridListTile className={classes.tile} key={card} cols={1}>
          <MovieCard key={card} movie={movie} imageUrl={imageUrl} />
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
        <Notifications>{clientNotifications}</Notifications>
        <Notifications>{this.props.playlists.notifications}</Notifications>
      </>
    );
  }
}

const mapStateToProps = (state, props) => ({
  clientNotifications: getClientNotifications(state),
  movies: getMovies(state),
  playlists: state.playlists,
  ratings: getRatings(state),
  movieErrors: getMoviesAsErrors(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    { doMoviesRequesting, doMovieSearchRequesting, doUpdateGenre, doRatingAdd }
  )(withWidth()(withStyles(styles)(MoviesContainer)))
);
