import React, { Component } from "react";
import { connect } from "react-redux";
import { getMovies } from "../redux/actions/movieActions";
import { withRouter } from "react-router-dom";
import MovieCard from "../components/MovieCard";

//material-ui
import AppBar from "@material-ui/core/AppBar";
import Button from "@material-ui/core/Button";
import CameraIcon from "@material-ui/icons/PhotoCamera";
import Grid from "@material-ui/core/Grid";
import GridList from "@material-ui/core/GridList";
import GridListTile from "@material-ui/core/GridListTile";
import Toolbar from "@material-ui/core/Toolbar";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";
import withWidth from "@material-ui/core/withWidth";

const styles = theme => ({
  root: {
    display: "flex",
    flexWrap: "wrap",
    justifyContent: "space-around",
    backgroundColor: theme.palette.background.paper
  },
  appBar: {
    position: "relative"
  },
  icon: {
    marginRight: theme.spacing.unit * 2
  },
  heroUnit: {
    backgroundColor: theme.palette.background.paper
  },
  heroContent: {
    maxWidth: 600,
    margin: "0 auto",
    padding: `${theme.spacing.unit * 8}px 0 ${theme.spacing.unit * 6}px`
  },
  heroButtons: {
    marginTop: theme.spacing.unit * 4
  },
  footer: {
    backgroundColor: theme.palette.background.paper,
    padding: theme.spacing.unit * 6
  },
  subheader: {
    width: "100%"
  }
});

class MoviesContainer extends Component {
  componentDidMount() {
    this.props.dispatch(getMovies());
  }
  render() {
    const { classes, width } = this.props;

    const columns = {
      sm: 2,
      md: 4,
      lg: 6
    };

    let card = 0;
    let movies = this.props.movies.map(movie => {
      let imageUrl = "https://image.tmdb.org/t/p/w500" + movie.poster_path;
      card += 1;
      // debugger;
      return (
        <GridListTile key={card} cols={1}>
          <MovieCard key={card} imageUrl={imageUrl} />
        </GridListTile>
      );
    });

    return (
      <>
        <AppBar position="static" className={classes.appBar}>
          <Toolbar>
            <CameraIcon className={classes.icon} />
            <Typography variant="h6" color="inherit" noWrap>
              Album layout
            </Typography>
          </Toolbar>
        </AppBar>
        <main>
          {/* Hero unit */}
          <div className={classes.heroUnit}>
            <div className={classes.heroContent}>
              <Typography
                component="h1"
                variant="h2"
                align="center"
                color="textPrimary"
                gutterBottom
              >
                Album layout
              </Typography>
              <Typography
                variant="h6"
                align="center"
                color="textSecondary"
                paragraph
              >
                Something short and leading about the collection below—its
                contents, the creator, etc. Make it short and sweet, but not too
                short so folks don&apos;t simply skip over it entirely.
              </Typography>
            </div>
          </div>
        </main>
        <div className={classes.heroButtons}>
          <Grid container spacing={16} justify="center">
            <Grid item>
              <Button variant="contained" color="primary">
                Main call to action
              </Button>
            </Grid>
            <Grid item>
              <Button variant="outlined" color="primary">
                Secondary action
              </Button>
            </Grid>
          </Grid>
        </div>
        <div className={classes.root}>
          <GridList
            cellHeight="auto"
            className={classes.gridList}
            spacing={3}
            cols={columns[width]}
          >
            {movies}
          </GridList>
        </div>
      </>
    );
  }
}

const mapStateToProps = (state, props) => ({
  movies: state.movies
});

export default withRouter(
  connect(
    mapStateToProps,
    undefined
  )(withWidth()(withStyles(styles)(MoviesContainer)))
);
