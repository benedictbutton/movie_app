import React, { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import backgroundImage from "../assets/dark-grey-metal.jpg";
import userImage from "../assets/no-poster.jpg";
// material-ui
import Button from "@material-ui/core/Button";
import EditIcon from "@material-ui/icons/Edit";
import Fade from "@material-ui/core/Fade";
import Grid from "@material-ui/core/Grid";
import Paper from "@material-ui/core/Paper";
import Snackbar from "@material-ui/core/Snackbar";
import StarIcon from "@material-ui/icons/Star";
import TextField from "@material-ui/core/TextField";
import Tooltip from "@material-ui/core/Tooltip";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    flex: 1,
    width: "100%",
    height: "100%",
    backgroundColor: "#eeeeee"
  },
  main: {
    flex: 1,
    justifyContent: "space-around",
    alignItems: "flex-start"
  },
  layout: {
    padding: theme.spacing.unit * 3,
    margin: theme.spacing.unit * 3,
    background: `url(${backgroundImage})`
  },
  grid: {
    height: "auto",
    padding: "56.25% 0 0 0",
    maxWidth: 200
  },
  media: {
    width: "75%",
    height: "50%"
  },
  btnMargin: {
    marginTop: theme.spacing.unit
  },
  rightIcon: {
    marginLeft: theme.spacing.unit
  },
  starGrid: {
    flex: 1
  },
  stars: {
    background: "rgba(0, 0, 0, 0.5)",
    maxHeight: 48
  },
  overview: {
    color: "#343434"
  },
  input: {
    color: "white",
    borderColor: "white"
  },
  cssLabel: {
    color: "white"
  },
  cssOutlinedInput: {
    "&$cssFocused $notchedOutline": {
      borderColor: "white !important"
    }
  },
  notchedOutline: {
    borderWidth: "2px",
    borderColor: "white !important"
  },
  cssFocused: { borderWidth: "2px", borderColor: "white" },
  textField: {
    marginLeft: theme.spacing.unit,
    marginRight: theme.spacing.unit
  },

  title: {
    marginBottom: theme.spacing.unit * 3,
    color: "#2F4F4F",
    fontWeight: "700"
  },
  snack: {
    color: "white",
    backgroundColor: theme.palette.primary.dark
  }
});

export const User = props => {
  const { classes } = props;
  const { username, email } = props.user.profile;

  const [open, setOpen] = useState(false);

  const stars = [1, 2, 3, 4, 5].map(el => (
    <StarIcon key={el} size={20} style={{ color: "yellow" }} />
  ));

  return (
    <Grid container className={classes.root}>
      <Grid item xs={12} md={8}>
        <Paper className={classes.layout}>
          <Grid container className={classes.main} spacing={16}>
            <Grid item xs={12} sm={5} className={classes.grid}>
              <img
                src={userImage}
                className={classes.media}
                alt="avatar image"
              />
              <Paper className={classes.stars}>
                <Grid
                  container
                  className={classes.starGrid}
                  alignItems="center"
                  justify="space-evenly"
                >
                  {stars}
                </Grid>
              </Paper>
              <Grid container className={classes.btnMargin}>
                <Grid item xs={12}>
                  <Tooltip title="Clear rating" placement="bottom">
                    <Button
                      variant="outlined"
                      color="primary"
                      alt="clear rating"
                      fullWidth
                      onClick={() => setOpen(true)}
                    >
                      Upload Image
                      <FontAwesomeIcon
                        className={classes.rightIcon}
                        icon="upload"
                      />
                    </Button>
                  </Tooltip>
                </Grid>
              </Grid>
            </Grid>
            <Grid item sm={7}>
              <Grid container>
                <Grid item xs={6}>
                  <TextField
                    id="outlined-read-only-input"
                    label="Username"
                    value={username}
                    className={classes.textField}
                    margin="normal"
                    InputLabelProps={{
                      classes: {
                        root: classes.cssLabel,
                        focused: classes.cssFocused
                      }
                    }}
                    InputProps={{
                      readOnly: true,
                      classes: {
                        input: classes.input,
                        root: classes.cssOutlinedInput,
                        notchedOutline: classes.notchedOutline,
                        focused: classes.cssFocused
                      }
                    }}
                    variant="outlined"
                  />
                </Grid>
                <Grid item xs={6}>
                  <TextField
                    id="outlined-read-only-input"
                    label="Email"
                    value={email}
                    className={classes.textField}
                    margin="normal"
                    InputLabelProps={{
                      classes: {
                        root: classes.cssLabel,
                        focused: classes.cssFocused
                      }
                    }}
                    InputProps={{
                      readOnly: true,
                      classes: {
                        input: classes.input,
                        root: classes.cssOutlinedInput,
                        notchedOutline: classes.notchedOutline,
                        focused: classes.cssFocused
                      }
                    }}
                    variant="outlined"
                  />
                </Grid>
                <Grid item xs={12}>
                  <TextField
                    fullWidth
                    id="outlined-read-only-input"
                    label="Password"
                    defaultValue="**********"
                    className={classes.textField}
                    margin="normal"
                    InputLabelProps={{
                      classes: {
                        root: classes.cssLabel,
                        focused: classes.cssFocused
                      }
                    }}
                    InputProps={{
                      readOnly: true,
                      classes: {
                        input: classes.input,
                        root: classes.cssOutlinedInput,
                        notchedOutline: classes.notchedOutline,
                        focused: classes.cssFocused
                      }
                    }}
                    variant="outlined"
                  />
                </Grid>
                <Grid
                  container
                  className={classes.btnMargin}
                  justify="flex-end"
                >
                  <Grid item xs={4}>
                    <Tooltip
                      title={true ? "Remove from playlist" : "Add to playlist"}
                      placement="bottom"
                    >
                      <Button
                        variant="contained"
                        color="primary"
                        alt="clear rating"
                        fullWidth
                        onClick={() => setOpen(true)}
                      >
                        <EditIcon style={{ color: "white" }} />
                      </Button>
                    </Tooltip>
                  </Grid>
                </Grid>
              </Grid>
            </Grid>
          </Grid>
        </Paper>
      </Grid>{" "}
      <Snackbar
        className={classes.snack}
        anchorOrigin={{ vertical: "top", horizontal: "right" }}
        autoHideDuration={5000}
        open={open}
        onClose={() => setOpen(false)}
        ContentProps={{
          "aria-describedby": "message-id",
          className: classes.snack
        }}
        TransitionComponent={Fade}
        message={<span id="message-id"> TBD - Coming soon</span>}
      />
    </Grid>
  );
};

export default withStyles(styles)(User);
