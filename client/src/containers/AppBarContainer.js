import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { reduxForm, reset, Field } from "redux-form";
import {
  doMoviesRequesting,
  doMovieCategoryRequesting,
  doMovieSearchRequesting,
  doUpdateGenre,
  doUpdateSearch
} from "../redux/actions/movieActions";
import FilterContainer from "./FilterContainer";
import SearchField from "../components/SearchField";
// material-ui
import { fade } from "@material-ui/core/styles/colorManipulator";
import AppBar from "@material-ui/core/AppBar";
import Grid from "@material-ui/core/Grid";
import ListSubheader from "@material-ui/core/ListSubheader";
import Toolbar from "@material-ui/core/Toolbar";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    display: "flex",
    width: "100%"
  },
  bar: {
    background: "transparent",
    position: "relative"
  },
  genre: {
    paddingTop: 0,
    paddingBottom: 0
  },
  grow: {
    flexGrow: 1
  },
  search: {
    position: "relative",
    borderRadius: theme.shape.borderRadius,
    backgroundColor: fade(theme.palette.common.white, 0.15),
    "&:hover": {
      backgroundColor: fade(theme.palette.common.white, 0.25)
    },
    marginLeft: 0,
    marginRight: 0,
    width: "100%",
    [theme.breakpoints.up("sm")]: {
      marginLeft: theme.spacing.unit,
      width: "auto"
    }
  }
});

const categoryList = {
  genre: "Genre",
  "trending/all/week": "Trending",
  "movie/top_rated": "Top Rated",
  "movie/popular": "Popular",
  "movie/now_playing": "In Theaters",
  "movie/upcoming": "Upcoming"
};

const genreList = {
  18: "Drama",
  53: "Thriller",
  10749: "Romance",
  35: "Comedy",
  28: "Action",
  99: "Documentary",
  878: "SciFi",
  27: "Horror"
};

class AppBarContainer extends Component {
  state = {
    categoryName: "",
    genreName: "",
    display: false
  };

  handleCategory = event => {
    this.setState({ categoryName: event.target.value });
    const payload = { type: "multi", page: 1, tag: event.target.value };
    if (event.target.value !== "genre") {
      this.setState({ display: false });
      this.props.doUpdateGenre(payload);
      this.props.doMovieCategoryRequesting(payload);
    } else this.setState({ display: true });
    this.props.history.push(`/ms/movies/multi/${payload.tag}`);
  };

  handleGenre = event => {
    this.setState({ genreName: event.target.value });
    const payload = { type: "discover", page: 0, tag: event.target.value };
    this.props.doUpdateGenre(payload);
    this.props.doMoviesRequesting(payload);
    this.props.history.push(`/ms/movies/discover/${payload.tag}`);
  };

  handleSearch = event => {
    const payload = { type: "search", page: 0, tag: event.query };
    this.props.reset("search");
    this.props.doUpdateSearch(payload);
    this.props.doMovieSearchRequesting(payload);
    this.props.history.push(`/ms/movies/search/${payload.tag}`);
  };

  render() {
    const { classes, handleSubmit } = this.props;

    return (
      <>
        <AppBar className={classes.bar}>
          <Grid container justify="space-between" alignItems="flex-start">
            <Grid item>
              <Grid container justify="flex-start">
                <Grid item>
                  <ListSubheader component="div">
                    <FilterContainer
                      specificList={categoryList}
                      listName={this.state.categoryName}
                      handleList={this.handleCategory}
                      display={true}
                      color="primary"
                      choice="Search"
                      handleSelect={this.props.handleSelect}
                    />
                  </ListSubheader>
                </Grid>
                <Grid item>
                  <ListSubheader component="div">
                    <FilterContainer
                      specificList={genreList}
                      listName={this.state.genreName}
                      handleList={this.handleGenre}
                      display={this.state.display}
                      color="#ecca00"
                      choice="Select"
                      handleSelect={this.props.handleSelect}
                    />
                  </ListSubheader>
                </Grid>
              </Grid>
            </Grid>
            <Grid item>
              <div className={classes.root}>
                <Toolbar className={classes.root}>
                  <div className={classes.grow} />
                  <div className={classes.search}>
                    <form onSubmit={handleSubmit(this.handleSearch)}>
                      <Field name="query" type="text" component={SearchField} />
                    </form>
                  </div>
                </Toolbar>
              </div>
            </Grid>
          </Grid>
        </AppBar>
      </>
    );
  }
}

const searchForm = {
  form: `search`
};

AppBarContainer = reduxForm(searchForm)(AppBarContainer);
export default withRouter(
  connect(
    null,
    {
      doMoviesRequesting,
      doMovieCategoryRequesting,
      doMovieSearchRequesting,
      doUpdateGenre,
      doUpdateSearch,
      dispatch: reset("search")
    }
  )(withStyles(styles)(AppBarContainer))
);
