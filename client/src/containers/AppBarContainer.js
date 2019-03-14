import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import { reduxForm, Field } from "redux-form";
import { doMovieSearchRequesting } from "../redux/actions/movieActions";
import SearchField from "../components/SearchField";
// material-ui
import { fade } from "@material-ui/core/styles/colorManipulator";
import Toolbar from "@material-ui/core/Toolbar";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    width: "100%"
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
  render() {
    const { classes, handleSubmit } = this.props;

    return (
      <>
        <div className={classes.root}>
          <Toolbar backgroundColor="primary">
            <div className={classes.grow} />
            <div className={classes.search}>
              <form onSubmit={handleSubmit(this.props.handleSearch)}>
                <Field name="query" type="text" component={SearchField} />
              </form>
            </div>
          </Toolbar>
        </div>
      </>
    );
  }
}

const searchForm = {
  form: `search`
};

AppBarContainer = reduxForm(searchForm)(AppBarContainer);
export default withRouter(withStyles(styles)(AppBarContainer));
