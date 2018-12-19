import React from "react";
import { withRouter } from "react-router-dom";
//material-ui
import Card from "@material-ui/core/Card";
import CardContent from "@material-ui/core/CardContent";
import CardHeader from "@material-ui/core/CardHeader";
import CardMedia from "@material-ui/core/CardMedia";
import Grid from "@material-ui/core/Grid";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    display: "flex",
    alignItems: "flex-start",
    justify: "flex-start",
    padding: theme.spacing.unit * 2
  },
  card: {
    display: "flex",
    justify: "flex-start",
    alignItems: "flex-start",
    padding: theme.spacing.unit * 2,
    margin: theme.spacing.unit * 2,
    width: "75%"
  },
  grid: {
    height: "0",
    padding: "0 0 75% 0"
  },
  media: {
    flex: 1,
    width: "100%",
    height: "auto"
  },
  content: {
    flex: "1 0 auto"
  }
});

const Movie = props => {
  const { classes } = props;
  let { title, imageUrl, overview } = props.location.state;

  return (
    <Grid container className={classes.root}>
      <Grid item xs={12}>
        <Grid container spacing={8} justify="flex-start">
          <Card className={classes.card}>
            <Grid item xs={12} sm={6} className={classes.grid}>
              <Card>
                <CardMedia
                  component="img"
                  className={classes.media}
                  image={imageUrl}
                />
              </Card>
            </Grid>
            <Grid item xs={12} sm={6}>
              <CardHeader title={title} />
              <CardContent className={classes.content}>
                <Typography component="p">{overview}</Typography>
              </CardContent>
            </Grid>
          </Card>
        </Grid>
      </Grid>
    </Grid>
  );
};

export default withRouter(withStyles(styles)(Movie));
