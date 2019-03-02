import React from "react";
import { withRouter } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
//material-ui
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import ListItemIcon from "@material-ui/core/ListItemIcon";
import ListItemText from "@material-ui/core/ListItemText";

const LogOut = props => {
  return (
    <>
      <List>
        <ListItem button onClick={props.logout} key="Log Out">
          <ListItemIcon>
            <FontAwesomeIcon icon="sign-out-alt" />
          </ListItemIcon>
          <ListItemText primary="Log Out" />
        </ListItem>
      </List>
    </>
  );
};

export default withRouter(LogOut);
