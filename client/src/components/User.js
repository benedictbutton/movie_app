import React from "react";
// import { withRouter } from "react-router-dom";
// import { connect } from "react-redux";
// import compose from "recompose/compose";
// import { getUser } from "../redux/actions/userActions";
//material-ui
import Grid from "@material-ui/core/Grid";
import Paper from "@material-ui/core/Paper";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    flexGrow: 1
  },
  paper: {
    padding: theme.spacing.unit * 2,
    textAlign: "center",
    color: theme.palette.text.secondary
  }
});

const User = props => {
  const { classes } = props;
  const { id } = props.user;

  return (
    <Grid container spacing={16} justify="center">
      <Grid item xs={3}>
        <Paper className={classes.paper}>{id}</Paper>
      </Grid>
    </Grid>
  );
};

// const mapStateToProps = (state, props) => ({
//   user: state.user,
//   props: props
// });

// const mapDispatchToProps = dispatch => ({
//   getUser: () => dispatch(getUser)
// });

// export default withRouter(
//   compose(
//     withStyles(styles, { name: "User" }),
//     connect(mapStateToProps)
//   )(User)
// );

export default withStyles(styles)(User);
