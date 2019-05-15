import React from "react";
// material-ui
import CircularProgress from "@material-ui/core/CircularProgress";

const LoadingIndicator = props => {
  const { children } = props;
  return (
    <div>
      {children.requesting && !children.successful ? (
        <CircularProgress style={{ color: "#ecca00" }} />
      ) : null}
    </div>
  );
};

export default LoadingIndicator;
