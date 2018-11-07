import React from "react";
//material-ui
import Grid from "@material-ui/core/Grid";
import Card from "@material-ui/core/Card";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardContent from "@material-ui/core/CardContent";
import CardMedia from "@material-ui/core/CardMedia";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    flexGrow: 1
  },
  paper: {
    padding: theme.spacing.unit * 2,
    textAlign: "center",
    color: theme.palette.text.secondary
  },
  card: {
    width: "100vh"
  }
});

const User = props => {
  const { classes } = props;
  const { firstName, lastName, email } = props.user;

  return (
    <Grid container direction="row" justify="center">
      <Card className={classes.card}>
        <CardActionArea>
          <CardMedia
            component="img"
            alt="Profile Avatar"
            height="auto"
            image="https://images.pexels.com/photos/371633/pexels-photo-371633.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
            title=""
          />
          <CardContent>
            <Typography gutterBottom variant="h5" component="h1">
              {firstName} {lastName}
            </Typography>
            <Typography component="p">{email}</Typography>
          </CardContent>
        </CardActionArea>
      </Card>
    </Grid>
  );
};

export default withStyles(styles)(User);
