import React, { Component } from "react";
import { connect } from "react-redux";
import { doSignOut } from "../redux/actions/formActions";
import { doRatingAdd } from "../redux/actions/ratingActions";
import {
  doFilterMovieRatings,
  doMyMoviesRequesting
} from "../redux/actions/movieActions";
import {
  getMoviesAsErrors,
  getRatings,
  getFilteredRatings
} from "../redux/selectors/selectors";
import FilterContainer from "./FilterContainer";
import LoadingIndicator from "../components/LoadingIndicator";
import MovieCard from "../components/MovieCard";
import Notifications from "../components/Notifications";
import ScrollButton from "../components/ScrollButton";
import StarList from "../components/StarList";
//material-ui
import AppBar from "@material-ui/core/AppBar";
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
  bar: {
    background: "transparent",
    position: "relative"
  },
  tile: {
    height: 0,
    padding: "56.25% 0 0 0",
    maxWidth: 500
  }
});

const starList = {
  all: "All",
  oneStar: <StarList rating="1" />,
  twoStar: <StarList rating="2" />,
  threeStar: <StarList rating="3" />,
  fourStar: <StarList rating="4" />,
  fiveStar: <StarList rating="5" />
};

class RatingsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      starName: ""
    };
    this.handleRating = this.handleRating.bind(this);
  }

  componentDidMount() {
    let keys = Object.keys(this.props.ratedMovies);
    this.props.doMyMoviesRequesting(keys);
  }

  handleRating(event) {
    this.props.doRatingAdd(event);
  }

  handleStar = event => {
    this.props.doFilterMovieRatings(event.target.value);
    this.setState({ starName: event.target.value });
  };

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
    let length = ratedMovies.length;
    if (length < 3 && columns[width] >= 3) {
      switch (length) {
        case 1:
        case 2:
          resize = 3;
          break;
        default:
          break;
      }
    }
    let card = 0;
    let movies = ratedMovies.map(movie => {
      let imageUrl = "https://image.tmdb.org/t/p/w500" + movie.poster_path;
      card += 1;
      return (
        <GridListTile className={classes.tile} key={card} cols={resize}>
          <MovieCard
            key={card}
            movie={movie}
            imageUrl={imageUrl}
            handleRating={this.handleRating}
          />
        </GridListTile>
      );
    });

    return (
      <>
        <AppBar className={classes.bar}>
          <FilterContainer
            specificList={starList}
            listName={this.state.starName}
            handleList={this.handleStar}
            display={true}
            color="primary"
            choice="Filter"
            handleSelect={this.props.handleSelect}
          />
        </AppBar>
        <div className={classes.root}>
          <LoadingIndicator>{this.props.ratedMovies}</LoadingIndicator>
          <ScrollButton scrollStepInPx="50" delayInMs="16.66" />
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
  ratedMovies: getFilteredRatings(state),
  ratings: getRatings(state),
  movieErrors: getMoviesAsErrors(state)
});

export default connect(
  mapStateToProps,
  { doFilterMovieRatings, doMyMoviesRequesting, doRatingAdd, doSignOut }
)(withWidth()(withStyles(styles)(RatingsContainer)));
