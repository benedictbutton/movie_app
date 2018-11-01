import React, { Component } from "react";
import { Route, Switch } from "react-router-dom";
import logo from "./logo.svg";
import "./App.css";

//App Components
import HomeContainer from "./containers/HomeContainer";
import SignInContainer from "./containers/SignInContainer";
import SignUpContainer from "./containers/SignUpContainer";
import UserContainer from "./containers/UserContainer";
// import User from "./components/User";

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <Switch>
            <Route exact path="/" component={HomeContainer} />
            <Route exact path="/sign-up" component={SignUpContainer} />
            <Route exact path="/login" component={SignInContainer} />
            <Route path="/users/:id" component={UserContainer} />
          </Switch>
        </header>
      </div>
    );
  }
}

export default App;
