import React, { Component } from "react";
import { Redirect } from "react-router-dom";

class ErrorBoundary extends Component {
  state = { hasError: false };

  static getDerivedStateFromError(error) {
    // Update state so the next render will show the fallback UI.
    return { hasError: true };
  }

  render() {
    if (this.state.hasError) {
      return this.props.render(this.state);
    }
    return this.props.children;
  }
}

export default ErrorBoundary;
