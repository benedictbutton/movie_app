import React, { useState } from "react";
import { Link } from "react-router-dom";
import Image from "../assets/dark-grey-metal.jpg";
// material-ui
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";
import Grid from "@material-ui/core/Grid";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  grid: {
    marginTop: theme.spacing.unit,
    marginBottom: theme.spacing.unit
  },
  paper: {
    background: `url(${Image})`
  },
  title: {
    fontSize: 15
  },
  type: {
    color: "#ecca00"
  }
});

const FullCast = props => {
  const [open, setOpen] = useState(false);
  const { movieTitle, cast, classes } = props;

  let fullCast = cast.map((member, idx) => {
    return (
      <Grid item xs={4} key={idx} className={classes.grid}>
        <Link
          to={{
            pathname: `/ms/person/${member.id}`,
            state: { name: member.name }
          }}
          style={{ textDecoration: "none" }}
        >
          <Typography className={classes.title} color="primary">
            {member.name}
          </Typography>
        </Link>
      </Grid>
    );
  });

  return (
    <div>
      <Button
        fullWidth
        variant="outlined"
        color="primary"
        onClick={() => setOpen(true)}
      >
        See full cast...
      </Button>
      <Dialog
        open={open}
        onClose={() => setOpen(false)}
        aria-labelledby="scroll-dialog-title"
        PaperProps={{ classes: { root: classes.paper } }}
      >
        <DialogTitle id="scroll-dialog-title" disableTypography>
          <Typography variant="h5" className={classes.type}>
            {movieTitle}
          </Typography>
        </DialogTitle>
        <DialogContent>
          <Grid container>{fullCast}</Grid>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setOpen(false)} className={classes.type}>
            Close
          </Button>
        </DialogActions>
      </Dialog>
    </div>
  );
};

export default withStyles(styles)(FullCast);
