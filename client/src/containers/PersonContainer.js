import React, { useState, useEffect, useLayoutEffect } from "react";
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
  getMoviesAsQuery,
  getRatings,
  getMoviesAsErrors
} from "../redux/selectors/selectors";
import poster from "../assets/no-poster.jpg";
import AppBarContainer from "./AppBarContainer";
// import LinearProgress from "@material-ui/core/LinearProgress";
import LoadingIndicator from "../components/LoadingIndicator";
import MovieCard from "../components/MovieCard";
import Notifications from "../components/Notifications";
import PersonCard from "../components/PersonCard";
import ScrollButton from "../components/ScrollButton";
import { StickyContainer, StickyBoundary } from "../HOC/Sticky";
import withSticky from "../HOC/Sticky";
// material-ui
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
    marginTop: theme.spacing.unit * 2,
    margin: theme.spacing.unit * 6
  },
  // content: {
  //   paddingTop: 60
  // },
  grid: {
    position: "relative"
  },
  tile: {
    height: "0",
    paddingTop: "56.25%"
  },
  personTile: {
    borderStyle: "solid",
    borderColor: "#ecca00",
    borderWidth: 5,
    marginBottom: theme.spacing.unit
  }
});

const StickyAppBar = withSticky(AppBarContainer);

const PersonContainer = props => {
  const {
    classes,
    width,
    clientNotifications,
    movieQuery,
    movieErrors,
    playlists,
    display,
    match: {
      params: { id: id }
    }
  } = props;

  const [isLoading, setIsLoading] = useState(false);
  const [movieData, setMovieData] = useState([]);
  const [profile, setProfile] = useState({});
  const [isError, setIsError] = useState(false);
  const [length, setLength] = useState(0);

  useEffect(() => {
    let fetchData = async () => {
      setIsError(false);
      setIsLoading(true);
      try {
        const promises = ["", "combined_credits"].map(request => {
          return fetch(
            `https://api.themoviedb.org/3/person/${id}/${request}?api_key=77d5d44b891ceb6d4b5e717b8e2e9256`,
            {
              method: "GET",
              headers: {
                "Content-Type": "application/json"
                // Authorization: `Bearer ${accessToken}`
              }
            }
          );
        });
        const response = await Promise.all(promises);
        const responseJson = await Promise.all(
          response.map(r => {
            if (!r.ok) throw new Error(r);
            return r.json();
          })
        );
        const name = responseJson[0].name.split(" ");
        setProfile({
          firstName: name[0],
          lastName: name[1],
          image: `https://image.tmdb.org/t/p/w500${
            responseJson[0].profile_path
          }`
        });
        setMovieData(responseJson[1].cast);
        setLength(responseJson[1].cast.length);
      } catch (error) {
        setIsError(true);
      }
      setIsLoading(false);
    };
    fetchData();
  }, []);

  const columns = {
    xs: 2,
    sm: 3,
    md: 4,
    lg: 6,
    xl: 8
  };

  let resize = 1;
  // 2 instead of 3 bc length does not include profile picture
  if (length < 2 && columns[width] >= 3) {
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
  let films = movieData.map(movie => {
    // let movie = movies.list[index];
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

  return (
    <StickyContainer>
      <StickyAppBar display={display} menuItem={props.location.state.name} />
      <StickyBoundary>
        <div className={classes.root}>
          <LoadingIndicator>{isLoading}</LoadingIndicator>
          <ScrollButton scrollStepInPx="300" delayInMs="16.66" />
          <GridList
            className={classes.grid}
            cellHeight="auto"
            spacing={10}
            cols={columns[width]}
          >
            <GridListTile
              className={(classes.tile, classes.personTile)}
              key={card}
              cols={resize}
            >
              <PersonCard
                firstName={profile.firstName}
                lastName={profile.lastName}
                profileImage={profile.image}
                name={profile.name}
              />
            </GridListTile>
          </GridList>
        </div>
      </StickyBoundary>
    </StickyContainer>
  );
};

const mapStateToProps = (state, props) => ({
  movieQuery: getMoviesAsQuery(state),
  clientNotifications: getClientNotifications(state),
  playlists: state.playlists,
  ratings: getRatings(state),
  movieErrors: getMoviesAsErrors(state)
});

export default connect(
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
)(withWidth()(withStyles(styles)(PersonContainer)));
