import React, { useEffect } from "react";
import { withStyles } from "@material-ui/core/styles";
import LinearProgress from "@material-ui/core/LinearProgress";

const styles = theme => ({
  root: {
    width: "100%",
    marginTop: theme.spacing.unit * 2
  }
});

const ProgressIndicator = ({ step, max, setStep, classes }) => {
  const normalise = value => (value * 100) / max;

  useEffect(() => {
    const timer = setInterval(() => {
      setStep(prevProgress => step);
    }, 300);

    return () => {
      clearInterval(timer);
    };
  }, [setStep, step]);

  return (
    <>
      <div className={classes.root}>
        <LinearProgress variant="determinate" value={normalise(step)} />
      </div>
    </>
  );
};

export default withStyles(styles)(ProgressIndicator);
