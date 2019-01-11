import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import { connect } from "react-redux";
// import { getMovies } from "../redux/selectors/movies";
import { doRatingAdd } from "../redux/actions/ratingActions";
import { doMyMoviesRequesting } from "../redux/actions/movieActions";
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

class RatingsContainer extends Component {
  constructor(props) {
    super(props);
    this.handleRating = this.handleRating.bind(this);
  }

  componentDidMount() {
    this.props.doMyMoviesRequesting();
  }

  handleRating(event) {
    this.props.doRatingAdd(event);
  }

  render() {
    const { classes, width } = this.props;
    const columns = {
      sm: 2,
      md: 4,
      lg: 6
    };

    let card = 0;
    let movies = Object.values(this.props.movies.list).map(movie => {
      let { id, title, overview } = movie;
      id = id.toString();
      let imageUrl = "https://image.tmdb.org/t/p/w500" + movie.poster_path;
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
        <div>
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
            <GridListTile
              key="Subheader"
              cols={columns[width]}
              style={{ height: "auto" }}
            >
              <ListSubheader component="div">
                <GenreContainer />
              </ListSubheader>
            </GridListTile>
            {movies}
          </GridList>
        </div>
        <Notifications />
      </>
    );
  }
}

const mapStateToProps = state => ({
  movies: getMovies(state),
  ratings: getRatings(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    { doMyMoviesRequesting, doRatingAdd }
  )(withWidth()(withStyles(styles)(RatingsContainer)))
);
