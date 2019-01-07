import React, { Component } from "react";
import { Route, Switch } from "react-router-dom";
import "./App.css";
//font awesome
import { library } from "@fortawesome/fontawesome-svg-core";
import {
  faSignOutAlt,
  faBars,
  faUser,
  faFilm,
  faSortDown
} from "@fortawesome/free-solid-svg-icons";
//App Components
import HeaderContainer from "./containers/HeaderContainer";
import HomeContainer from "./containers/HomeContainer";
import MovieContainer from "./containers/MovieContainer";
import MoviesContainer from "./containers/MoviesContainer";
import SignInContainer from "./containers/SignInContainer";
import SignUpContainer from "./containers/SignUpContainer";
import UserContainer from "./containers/UserContainer";
// import User from "./components/User";

library.add(faSignOutAlt, faBars, faUser, faFilm, faSortDown);

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <Route exact path="/" component={HomeContainer} />
          <Route path="/ms" component={HeaderContainer} />
          <Switch>
            <Route path="/ms/sign-up" component={SignUpContainer} />
            <Route path="/ms/sign-in" component={SignInContainer} />
            <Route path="/ms/movies" component={MoviesContainer} />
            <Route path="/ms/movie/:id" component={MovieContainer} />
            <Route path="/ms/users/:id" component={UserContainer} />
          </Switch>
        </header>
      </div>
    );
  }
}

export default App;
