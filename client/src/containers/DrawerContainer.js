import React from "react";
import LogOutContainer from "./LogOutContainer";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Link, withRouter } from "react-router-dom";
//material-ui
import Drawer from "@material-ui/core/Drawer";
import Button from "@material-ui/core/Button";
import List from "@material-ui/core/List";
import Divider from "@material-ui/core/Divider";
import ListItem from "@material-ui/core/ListItem";
import ListItemIcon from "@material-ui/core/ListItemIcon";
import ListItemText from "@material-ui/core/ListItemText";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  button: {
    color: "white"
  },
  icon: {
    marginRight: theme.spacing.unit * 2
  },
  list: {
    width: 250
  },
  fullList: {
    width: "auto"
  }
});

class DrawerContainer extends React.Component {
  constructor(props) {
    super(props);
    this.toggleDrawer = this.toggleDrawer.bind(this);
  }
  state = {
    left: false
  };

  toggleDrawer = (side, open) => () => {
    this.setState({
      left: open
    });
  };

  render() {
    const { classes } = this.props;

    const sideList = (
      <div className={classes.list}>
        <List>
          <Link to="/ms/users/:id" key="Profile">
            <ListItem button key="Profile">
              <ListItemIcon>
                <FontAwesomeIcon icon="user" />
              </ListItemIcon>
              <ListItemText primary="Profile" />
            </ListItem>
          </Link>
          <Link to="/ms/movies" key="Movies">
            <ListItem button key="Movies">
              <ListItemIcon>
                <FontAwesomeIcon icon="film" />
              </ListItemIcon>
              <ListItemText primary="Movies" />
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
            color="white"
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
      </div>
    );
  }
}

export default withRouter(withStyles(styles)(DrawerContainer));
