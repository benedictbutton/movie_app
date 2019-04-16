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
import CategorySearchContainer from "./CategorySearchContainer";
import GenreContainer from "./GenreContainer";
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

class AppBarContainer extends Component {
  state = {
    categoryName: "",
    genreName: "",
    display: false
  };

  handleChange = event => {
    this.setState({ categoryName: event.target.value });
    const payload = { type: "multi", page: 1, tag: event.target.value };
    if (event.target.value !== "genre") {
      this.setState({ display: false });
      this.props.doUpdateGenre(payload);
      this.props.doMovieCategoryRequesting(payload);
    } else this.setState({ display: true });
  };

  handleGenre = event => {
    this.setState({ genreName: event.target.value });
    const payload = { type: "discover", page: 0, tag: event.target.value };
    this.props.doUpdateGenre(payload);
    this.props.doMoviesRequesting(payload);
  };

  handleSearch = event => {
    const payload = { type: "search", page: 0, tag: event.query };
    this.props.reset("search");
    this.props.doUpdateSearch(payload);
    this.props.doMovieSearchRequesting(payload);
  };

  render() {
    const { classes, handleSubmit, reset } = this.props;

    return (
      <>
        <AppBar className={classes.bar}>
          <Grid container justify="space-between" alignItems="flex-start">
            <Grid item>
              <Grid container justify="flex-start">
                <Grid item>
                  <ListSubheader component="div">
                    <CategorySearchContainer
                      categoryName={this.state.categoryName}
                      handleChange={this.handleChange}
                      handleSelect={this.props.handleSelect}
                    />
                  </ListSubheader>
                </Grid>
                <Grid item>
                  <ListSubheader component="div">
                    <GenreContainer
                      display={this.state.display}
                      genreName={this.state.genreName}
                      handleGenre={this.handleGenre}
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
