import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { doRatingAdd } from "../redux/actions/ratingActions";
import { doMoviesRequesting } from "../redux/actions/movieActions";
import {
  getClientNotifications,
  getMovies,
  getRatings,
  getMoviesAsErrors
} from "../redux/selectors/selectors";
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
  footer: {
    backgroundColor: theme.palette.background.paper,
    padding: theme.spacing.unit * 6
  },
  tile: {
    height: "0",
    paddingTop: "56.25%"
  }
});

class MoviesContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      page: 0
    };
  }

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

  render() {
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
      let { id, title, overview, poster_path } = this.props.movies.list[index];
      id = id.toString();
      let imageUrl = "https://image.tmdb.org/t/p/w500" + poster_path;
      card += 1;
      return (
        <GridListTile className={classes.tile} key={card} cols={1}>
          <MovieCard
            key={card}
            id={id}
            title={title}
            overview={overview}
            imageUrl={imageUrl}
          />
        </GridListTile>
      );
    });

    return (
      <>
        <div className={classes.root}>
          <Grid container>
            <ListSubheader component="div">
              <GenreContainer />
            </ListSubheader>
          </Grid>
          <GridList cellHeight="auto" spacing={10} cols={columns[width]}>
            {movies}
          </GridList>
        </div>
        <Notifications>{movieErrors}</Notifications>
        <Notifications>{clientNotifications}</Notifications>
      </>
    );
  }
}

const mapStateToProps = (state, props) => ({
  clientNotifications: getClientNotifications(state),
  movies: getMovies(state),
  ratings: getRatings(state),
  movieErrors: getMoviesAsErrors(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    { doMoviesRequesting, doRatingAdd }
  )(withWidth()(withStyles(styles)(MoviesContainer)))
);
