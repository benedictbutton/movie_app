import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { doRatingAdd } from "../redux/actions/ratingActions";
import { doMoviesRequesting } from "../redux/actions/movieActions";
import { getMovies, getRatings } from "../redux/selectors/selectors";
import GenreContainer from "./GenreContainer";
import MovieCard from "../components/MovieCard";
import Notifications from "../components/Notifications";
//material-ui
import Button from "@material-ui/core/Button";
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
    justifyContent: "space-around",
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
    height: "0",
    padding: "56.25% 0 0 0"
  },
  titleBar: {
    background:
      "linear-gradient(to bottom, rgba(0,0,0,0.7) 0%, " +
      "rgba(0,0,0,0.3) 70%, rgba(0,0,0,0) 100%)"
  }
});

class MoviesContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      page: 0
    };
    this.handleRating = this.handleRating.bind(this);
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

  handleRating(event) {
    this.props.doRatingAdd(event);
  }

  render() {
    const { classes, width } = this.props;
    //Provides breakpoints for number of movies per column according to screen size
    const columns = {
      sm: 2,
      md: 4,
      lg: 6,
      xl: 6
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
            handleRating={this.handleRating}
          />
        </GridListTile>
      );
    });

    return (
      <>
        <div className={classes.root}>
          <Grid container alignItems="left">
            <ListSubheader alignItems="left" component="div">
              <GenreContainer />
            </ListSubheader>
          </Grid>
          <GridList cellHeight="auto" spacing={10} cols={columns[width]}>
            {movies}
          </GridList>
        </div>
        <Notifications />
      </>
    );
  }
}

const mapStateToProps = (state, props) => ({
  movies: getMovies(state),
  ratings: getRatings(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    { doMoviesRequesting, doRatingAdd }
  )(withWidth()(withStyles(styles)(MoviesContainer)))
);
