import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { reduxForm, reset, Field } from "redux-form";
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
  "movie/popular": "Popular",
  "trending/all/week": "Trending",
  "movie/top_rated": "Top Rated",
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
  handleCategory = event => {
    this.props.history.push(`/ms/movies/multi/${event.target.value}`);
  };

  handleGenre = event => {
    this.props.history.push(`/ms/movies/discover/${event.target.value}`);
  };

  handleSearch = event => {
    this.props.reset("search");
    this.props.history.push(`/ms/movies/search/${event.query}`);
  };

  render() {
    const {
      classes,
      display,
      handleSubmit,
      match: {
        params: { type }
      },
      menuItem
    } = this.props;

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
                      handleList={this.handleCategory}
                      display={true}
                      color="primary"
                      choice="Search"
                      name="categoryName"
                      menuItem={display ? "genre" : menuItem}
                    />
                  </ListSubheader>
                </Grid>
                <Grid item>
                  <ListSubheader component="div">
                    <FilterContainer
                      specificList={genreList}
                      handleList={this.handleGenre}
                      display={display}
                      color="#ecca00"
                      choice="Select"
                      name="genreName"
                      menuItem={type === "multi" ? "" : menuItem}
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
      dispatch: reset("search")
    }
  )(withStyles(styles)(AppBarContainer))
);
