import React from "react";
import { withRouter } from "react-router-dom";
import StarsContainer from "../containers/StarsContainer";
import Stars from "./Stars";
import Image from "../assets/brushed-metal.jpg";
//material-ui
import Card from "@material-ui/core/Card";
import CardContent from "@material-ui/core/CardContent";
import CardHeader from "@material-ui/core/CardHeader";
import CardMedia from "@material-ui/core/CardMedia";
import Grid from "@material-ui/core/Grid";
import Paper from "@material-ui/core/Paper";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  card: {
    display: "flex",
    justify: "flex-start",
    alignItems: "flex-start",
    padding: theme.spacing.unit * 2,
    margin: theme.spacing.unit * 4,
    width: "75%",
    maxHeight: 500,
    backgroundImage: `url(${Image})`
  },
  grid: {
    height: "0",
    padding: "0 0 75% 0",
    maxWidth: 250
  },
  media: {
    flex: 1,
    width: "100%",
    height: "auto",
    maxWidth: 250
  },
  content: {
    flex: "1 0 auto",
    position: "relative"
  },
  stars: {
    background: "rgba(0, 0, 0, 0.5)",
    maxHeight: 48
  }
});

const Movie = props => {
  const { classes } = props;
  let { id, title, imageUrl, overview } = props.location.state;

  return (
    <Grid container spacing={24} justify="flex-start">
      <Card className={classes.card}>
        <Grid item xs={12} className={classes.grid}>
          <Card>
            <CardMedia
              component="img"
              className={classes.media}
              image={imageUrl}
            />
            <Paper className={classes.stars}>
              <Stars id={id} starSize={20} />
            </Paper>
          </Card>
        </Grid>
        <Grid item xs={12}>
          <CardHeader title={title} />
          <CardContent className={classes.content}>
            <Grid container alignItems="center">
              <Grid item>
                <Typography component="p">{overview}</Typography>
              </Grid>
            </Grid>
          </CardContent>
        </Grid>
      </Card>
    </Grid>
  );
};

export default withRouter(withStyles(styles)(Movie));
