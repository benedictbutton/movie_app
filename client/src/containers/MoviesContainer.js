import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { reset } from "redux-form";
import { doRatingAdd } from "../redux/actions/ratingActions";
import {
  doMoviesRequesting,
  doMovieCategoryRequesting,
  doMovieSearchRequesting,
  doUpdateGenre,
  doUpdateSearch
} from "../redux/actions/movieActions";
import { doUnSetError } from "../redux/actions/notificationActions";
import {
  getClientNotifications,
  getMovies,
  getRatings,
  getMoviesAsErrors
} from "../redux/selectors/selectors";
import poster from "../assets/no-poster.jpg";
import AppBarContainer from "./AppBarContainer";
// import LinearProgress from "@material-ui/core/LinearProgress";
import LoadingIndicator from "../components/LoadingIndicator";
import MovieCard from "../components/MovieCard";
import Notifications from "../components/Notifications";
import ScrollButton from "../components/ScrollButton";
import withInfiniteScroll from "../HOC/withInfiniteScroll";
// material-ui
import Fade from "@material-ui/core/Fade";
import GridList from "@material-ui/core/GridList";
import GridListTile from "@material-ui/core/GridListTile";
import { StickyContainer, StickyBoundary } from "../HOC/Sticky";
import withSticky from "../HOC/Sticky";
import Snackbar from "@material-ui/core/Snackbar";
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
  // content: {
  //   paddingTop: 60
  // },
  grid: {
    position: "relative"
  },
  snack: {
    color: "white",
    backgroundColor: theme.palette.primary.dark
  },
  tile: {
    height: "0",
    paddingTop: "56.25%"
  }
});

const StickyAppBar = withSticky(AppBarContainer);

class MoviesContainer extends Component {
  render() {
    const {
      classes,
      width,
      clientNotifications,
      movieErrors,
      movies,
      playlists,
      display
    } = this.props;

    //Provides breakpoints for number of movies per row according to screen size
    const columns = {
      xs: 2,
      sm: 3,
      md: 4,
      lg: 6,
      xl: 8
    };

    let resize = 1;
    let length = this.props.movies.results.length;
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
    let films = movies.results.map(index => {
      let movie = movies.list[index];
      let profile = movie.poster_path ? false : true;

      let imageUrl = movie.poster_path
        ? "https://image.tmdb.org/t/p/w500" + movie.poster_path
        : movie.profile_path
        ? "https://image.tmdb.org/t/p/w500" + movie.profile_path
        : `${poster}`;
      card += 1;
      return (
        <GridListTile className={classes.tile} key={card} cols={resize}>
          <MovieCard
            key={card}
            movie={movie}
            profile={profile}
            imageUrl={imageUrl}
            errors={movieErrors}
          />
        </GridListTile>
      );
    });

    // {this.props.mode === "is-bottom" && (
    //   <StickyAppBar
    //     display={this.props.display}
    //     menuItem={this.props.movies.query.tag}
    //   />
    // )}

    return (
      <StickyContainer>
        <StickyAppBar
          display={this.props.display}
          menuItem={this.props.movies.query.tag}
          loading={this.props.movies.requesting}
        />
        <StickyBoundary>
          <div className={classes.root}>
            <LoadingIndicator>{movies.requesting}</LoadingIndicator>
            <ScrollButton scrollStepInPx="300" delayInMs="16.66" />
            <GridList
              className={classes.grid}
              cellHeight="auto"
              spacing={10}
              cols={columns[width]}
            >
              {films}
            </GridList>
          </div>
          <Snackbar
            className={classes.snack}
            anchorOrigin={{ vertical: "bottom", horizontal: "left" }}
            autoHideDuration={3000}
            open={clientNotifications.display}
            onClose={this.props.doUnSetError}
            ContentProps={{
              "aria-describedby": "message-id",
              className: classes.snack
            }}
            TransitionComponent={Fade}
            message={<span id="message-id">{clientNotifications.message}</span>}
          />
          <Notifications>{movieErrors}</Notifications>
          <Notifications>{playlists.notifications}</Notifications>
        </StickyBoundary>
      </StickyContainer>
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
    {
      doMoviesRequesting,
      doMovieCategoryRequesting,
      doMovieSearchRequesting,
      doUpdateGenre,
      doUpdateSearch,
      doRatingAdd,
      doUnSetError,
      dispatch: reset("search")
    }
  )(withWidth()(withStyles(styles)(withInfiniteScroll(MoviesContainer))))
);
