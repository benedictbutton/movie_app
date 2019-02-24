import React, { Component } from "react";
import { Redirect, withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { doSignOut } from "../redux/actions/formActions";
import { doRatingAdd } from "../redux/actions/ratingActions";
import { doMyMoviesRequesting } from "../redux/actions/movieActions";
import {
  getMoviesAsErrors,
  getRatings,
  getRatedMovies
} from "../redux/selectors/selectors";
import MovieCard from "../components/MovieCard";
import Notifications from "../components/Notifications";
//material-ui
import GridList from "@material-ui/core/GridList";
import GridListTile from "@material-ui/core/GridListTile";
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
  subheader: {
    backgroundColor: theme.palette.background.paper,
    width: "100%"
  },
  tile: {
    height: 0,
    padding: "56.25% 0 0 0",
    maxWidth: 500
  },
  titleBar: {
    background:
      "linear-gradient(to bottom, rgba(0,0,0,0.7) 0%, " +
      "rgba(0,0,0,0.3) 70%, rgba(0,0,0,0) 100%)"
  }
});

class RatingsContainer extends Component {
  constructor(props) {
    super(props);
    this.handleRating = this.handleRating.bind(this);
  }

  componentDidMount() {
    let keys = Object.keys(this.props.ratings.list);
    this.props.doMyMoviesRequesting(keys);
  }

  handleRating(event) {
    this.props.doRatingAdd(event);
  }

  render() {
    const { classes, width, ratedMovies, movieErrors } = this.props;
    //Provides breakpoints for number of movies per row according to screen size
    const columns = {
      xs: 2,
      sm: 3,
      md: 4,
      lg: 6,
      xl: 8
    };

    let resize = 1;
    let length = Object.keys(this.props.ratedMovies).length;
    if (length < 3 && columns[width] >= 3) {
      switch (length) {
        case 1:
        case 2:
          resize = 3;
          break;
      }
    }
    let card = 0;
    let movies = Object.values(ratedMovies).map(movie => {
      let { id, title, overview, poster_path } = movie;
      let imageUrl = "https://image.tmdb.org/t/p/w500" + poster_path;
      card += 1;
      return (
        <GridListTile className={classes.tile} key={card} cols={resize}>
          <MovieCard
            key={card}
            id={id}
            title={title}
            overview={overview}
            imageUrl={imageUrl}
            handleRating={this.handleRating}
          />
        </GridListTile>
      );
    });

    // if (movieErrors.code === 401) {
    //   this.props.doSignOut();
    //   sessionStorage.removeItem("jwt");
    //   localStorage.removeItem("state");
    //   return <Redirect to="/ms/sign-in" />;
    // }

    return (
      <>
        <div className={classes.root}>
          <GridList cellHeight="auto" spacing={10} cols={columns[width]}>
            {movies}
          </GridList>
        </div>
        <Notifications>{movieErrors}</Notifications>
      </>
    );
  }
}

// const getRatedMovies = createSelector(
//   [getRatingsAsIds, getMoviesAsList],
//   (ids, movies) =>
//     ids
//       .filter(id => {
//         return movies.hasOwnProperty(id);
//       })
//       .map(id => getMoviesRated(movies, id))
// );

const mapStateToProps = (state, props) => ({
  ratedMovies: getRatedMovies(state),
  ratings: getRatings(state),
  movieErrors: getMoviesAsErrors(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    { doMyMoviesRequesting, doRatingAdd, doSignOut }
  )(withWidth()(withStyles(styles)(RatingsContainer)))
);
