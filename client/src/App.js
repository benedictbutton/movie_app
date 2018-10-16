import React, { Component } from "react";
import { Route, Switch } from "react-router-dom";
import logo from "./logo.svg";
import "./App.css";

//App Components
import HomeContainer from "./containers/HomeContainer";
import SignInContainer from "./containers/SignInContainer";
import SignUpContainer from "./containers/SignUpContainer";

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <Switch>
            <Route exact path="/" component={HomeContainer} />
            <Route exact path="/sign-up" component={SignUpContainer} />
            <Route exact path="/login" component={SignInContainer} />
          </Switch>
        </header>
      </div>
    );
  }
}

export default App;
