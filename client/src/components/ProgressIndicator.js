import React, { useEffect } from "react";
import { withStyles } from "@material-ui/core/styles";
import LinearProgress from "@material-ui/core/LinearProgress";

const styles = theme => ({
  root: {
    width: "100%",
    marginTop: theme.spacing.unit * 2
  }
});

const ProgressIndicator = ({
  brokenImages,
  workingImages,
  progress,
  setProgress,
  completed,
  setCompleted,
  apiData,
  isSearching,
  setApiData,
  classes
}) => {
  useEffect(() => {
    if (!progress || !apiData) return;
    const timer = setInterval(() => {
      setCompleted(oldProgress => {
        if (completed === apiData.images.length) {
          return 0;
        }
        const diff = Math.random() * 10;
        return Math.min(oldProgress + diff, 100);
      });
    }, 500);

    return () => {
      setProgress(false);
      clearInterval(timer);
    };
  }, [
    apiData,
    completed,
    setCompleted,
    isSearching,
    setApiData,
    progress,
    setProgress
  ]);

  return (
    <>
      {isSearching ? (
        <div className={classes.root}>
          <LinearProgress variant="determinate" value={completed} />
        </div>
      ) : null}
    </>
  );
};

export default withStyles(styles)(ProgressIndicator);
