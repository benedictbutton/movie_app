import React from "react";
import { withRouter } from "react-router-dom";
import Image from "../assets/dark-grey-metal.jpg";
//material-ui
import Input from "@material-ui/core/Input";
import Grid from "@material-ui/core/Grid";
import FormControl from "@material-ui/core/FormControl";
import MenuItem from "@material-ui/core/MenuItem";
import Select from "@material-ui/core/Select";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    display: "flex",
    flexWrap: "wrap"
  },
  font: { color: "#ecca00" },
  formControl: {
    margin: theme.spacing.unit,
    minWidth: 120,
    maxWidth: 300
  },
  noLabel: {
    marginTop: theme.spacing.unit * 3
  },
  select: {
    "&:before": {
      borderColor: "#ecca00"
    }
  },
  icon: {
    color: "#ecca00"
  },
  regular: {
    fontWeight: theme.typography.fontWeightRegular
  },
  medium: {
    fontWeight: theme.typography.fontWeightMedium
  }
});

const ITEM_HEIGHT = 48;
const ITEM_PADDING_TOP = 8;
const MenuProps = {
  PaperProps: {
    style: {
      maxHeight: ITEM_HEIGHT * 4.5 + ITEM_PADDING_TOP,
      width: 250,
      backgroundImage: `url(${Image})`,
      borderStyle: "solid",
      borderColor: "#ecca00"
    }
  }
};

const FilterContainer = props => {
  const { classes } = props;

  let list = Object.keys(props.specificList).map((key, idx) => {
    return (
      <MenuItem
        key={idx}
        color={props.color}
        value={key}
        className={classes.medium}
        name={props.name}
      >
        <Typography color="primary" variant="h6">
          {props.specificList[key]}
        </Typography>
      </MenuItem>
    );
  });

  return (
    <div>
      {props.display ? (
        <div className={classes.root}>
          <Grid container>
            <Grid item>
              <FormControl className={classes.formControl}>
                <Select
                  classes={{ icon: classes.icon }}
                  displayEmpty
                  className={classes.select}
                  value={props.menuItem}
                  onChange={props.handleList}
                  inputProps={{
                    id: "select-multiple-placeholder"
                  }}
                  MenuProps={MenuProps}
                >
                  <MenuItem disabled value="">
                    <Typography className={classes.font} variant="h6">
                      <em>{props.choice}</em>
                    </Typography>
                  </MenuItem>
                  {list}
                </Select>
              </FormControl>
            </Grid>
          </Grid>
        </div>
      ) : null}
    </div>
  );
};

export default withRouter(withStyles(styles)(FilterContainer));
