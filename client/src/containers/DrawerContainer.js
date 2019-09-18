import React from "react";
import { Link, withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { getRatings, getAdmin } from "../redux/selectors/selectors";
import LogOutContainer from "./LogOutContainer";
//material-ui
import Button from "@material-ui/core/Button";
import Drawer from "@material-ui/core/Drawer";
import Fade from "@material-ui/core/Fade";
import List from "@material-ui/core/List";
import Divider from "@material-ui/core/Divider";
import ListItem from "@material-ui/core/ListItem";
import ListItemIcon from "@material-ui/core/ListItemIcon";
import ListItemText from "@material-ui/core/ListItemText";
import PlaylistPlayIcon from "@material-ui/icons/PlaylistPlay";
import Snackbar from "@material-ui/core/Snackbar";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  button: {
    color: "#ecca00"
  },
  icon: {
    margin: theme.spacing.unit * 1
  },
  list: {
    width: 250
  },
  fullList: {
    width: "auto"
  },
  snack: {
    color: "white",
    backgroundColor: theme.palette.primary.dark
  }
});

class DrawerContainer extends React.Component {
  constructor(props) {
    super(props);
    this.toggleDrawer = this.toggleDrawer.bind(this);
  }
  state = {
    left: false,
    open: false,
    openSnackbar: false
  };

  toggleDrawer = (side, open) => () => {
    this.setState({
      left: open
    });
  };

  handleClick = event => {
    this.setState({ openSnackbar: true });
  };

  handleClose = event => {
    this.setState({ openSnackbar: false });
  };

  render() {
    const { admin, ratings, classes } = this.props;
    const { open, openSnackbar } = this.state;
    const rating = Object.entries(ratings.list)[0];
    const isAdmin = admin ? "Admin" : "Admin (Demo)";

    const sideList = (
      <div className={classes.list}>
        <List>
          <Link to="/ms/admin" key="Admin">
            <ListItem button key="Profile">
              <ListItemIcon>
                <FontAwesomeIcon icon="lock" />
              </ListItemIcon>
              <ListItemText primary={isAdmin} />
            </ListItem>
          </Link>
          <Link to="/ms/users/:id" key="Profile">
            <ListItem button key="Profile">
              <ListItemIcon>
                <FontAwesomeIcon icon="user" />
              </ListItemIcon>
              <ListItemText primary="Profile" />
            </ListItem>
          </Link>
          <Link to="/ms/movies/multi/trending/all/week" key="Movies">
            <ListItem button key="Movies">
              <ListItemIcon>
                <FontAwesomeIcon icon="film" />
              </ListItemIcon>
              <ListItemText primary="Movies" />
            </ListItem>
          </Link>
          {rating[0] === "id" ? (
            <ListItem button key="Ratings" onClick={this.handleClick}>
              <ListItemIcon>
                <FontAwesomeIcon icon="star" />
              </ListItemIcon>
              <ListItemText primary="Ratings" />
            </ListItem>
          ) : (
            <Link to="/ms/ratings" key="Ratings">
              <ListItem button key="Ratings">
                <ListItemIcon>
                  <FontAwesomeIcon icon="star" />
                </ListItemIcon>
                <ListItemText primary="Ratings" />
              </ListItem>
            </Link>
          )}
          <Link to="/ms/playlists" key="Playlists">
            <ListItem button key="Playlists">
              <ListItemIcon>
                <PlaylistPlayIcon />
              </ListItemIcon>
              <ListItemText primary="Playlists" />
            </ListItem>
          </Link>
        </List>
        <Divider />
        <LogOutContainer />
      </div>
    );

    return (
      <div>
        <Button
          className={classes.button}
          onClick={this.toggleDrawer("left", true)}
        >
          <FontAwesomeIcon
            className={classes.icon}
            icon="bars"
            size="2x"
            color="#ecca00"
          />
          Menu
        </Button>
        <Drawer
          open={this.state.left}
          onClose={this.toggleDrawer("left", false)}
        >
          <div
            tabIndex={0}
            role="button"
            onClick={this.toggleDrawer("left", false)}
            onKeyDown={this.toggleDrawer("left", false)}
          >
            {sideList}
          </div>
        </Drawer>
        <Snackbar
          className={classes.snack}
          anchorOrigin={{ vertical: "top", horizontal: "right" }}
          autoHideDuration={5000}
          open={openSnackbar}
          onClose={this.handleClose}
          ContentProps={{
            "aria-describedby": "message-id",
            className: classes.snack
          }}
          TransitionComponent={Fade}
          message={
            <span id="message-id"> You haven't rated any movies yet</span>
          }
        />
      </div>
    );
  }
}

const mapStateToProps = state => ({
  ratings: getRatings(state),
  admin: getAdmin(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    null
  )(withStyles(styles)(DrawerContainer))
);
