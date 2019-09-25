import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { reduxForm, reset, Field } from "redux-form";
import ActivePlaylistContainer from "./ActivePlaylistContainer";
import FilterContainer from "./FilterContainer";
import SearchField from "../components/SearchField";
import StarList from "../components/StarList";
// material-ui
import { fade } from "@material-ui/core/styles/colorManipulator";
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
    background: "#0b0b0b",
    width: "100%",
    paddingTop: theme.spacing.unit
  },
  genre: {
    paddingTop: 0,
    paddingBottom: 0
  },
  grow: {
    flexGrow: 1
  },
  search: {
    color: "#ecca00",
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

const starList = {
  all: "All",
  oneStar: <StarList rating="1" />,
  twoStar: <StarList rating="2" />,
  threeStar: <StarList rating="3" />,
  fourStar: <StarList rating="4" />,
  fiveStar: <StarList rating="5" />
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
      menuItem,
      handleStar,
      starName
    } = this.props;

    const filterType = type ? (
      <FilterContainer
        specificList={categoryList}
        handleList={this.handleCategory}
        display={true}
        color="primary"
        choice="Search"
        name="categoryName"
        menuItem={display ? "genre" : menuItem}
      />
    ) : (
      <FilterContainer
        specificList={starList}
        listName={starName}
        handleList={handleStar}
        display={true}
        color="primary"
        choice="Filter"
        handleSelect={this.props.handleSelect}
        menuItem={starName}
      />
    );

    return (
      <Toolbar id="toolbar" className={classes.bar}>
        <Grid container justify="space-between" alignItems="center">
          <Grid item>
            <Grid container justify="flex-start">
              <Grid item>
                <ListSubheader component="div">{filterType}</ListSubheader>
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
            <ActivePlaylistContainer />
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
      </Toolbar>
    );
  }
}

const searchForm = {
  form: `search`
};

const mapStateToProps = (state, props) => ({});

AppBarContainer = reduxForm(searchForm)(AppBarContainer);
export default withRouter(
  connect(
    null,
    {
      dispatch: reset("search")
    }
  )(withStyles(styles)(AppBarContainer))
);
