import React from "react";
// material-ui
import CircularProgress from "@material-ui/core/CircularProgress";

const LoadingIndicator = props => {
  const { children } = props;

  return (
    <div>{children && <CircularProgress style={{ color: "#ecca00" }} />}</div>
  );
};

export default LoadingIndicator;
