import React, { Component } from "react";
import { Route, Switch } from "react-router-dom";
import logo from "./logo.svg";
import "./App.css";
//font awesome
import { library } from "@fortawesome/fontawesome-svg-core";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faSignOutAlt,
  faBars,
  faUser,
  faFilm
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

library.add(faSignOutAlt, faBars, faUser, faFilm);

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <Route exact path="/" component={HomeContainer} />
          <Route path="/ms" component={HeaderContainer} />
          <Route path="/ms/sign-up" component={SignUpContainer} />
          <Route path="/ms/sign-in" component={SignInContainer} />
          <Route path="/ms/movies" component={MoviesContainer} />
          <Route path="/ms/movie/:id" component={MovieContainer} />
          <Route path="/ms/users/:id" component={UserContainer} />
        </header>
      </div>
    );
  }
}

export default App;
