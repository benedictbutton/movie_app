import React, { Component } from "react";
import { Route, Switch } from "react-router-dom";
import "./App.css";
//font awesome
import { library } from "@fortawesome/fontawesome-svg-core";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faSignOutAlt,
  faBars,
  faUser,
  faFilm,
  faStar,
  faStepForward,
  faPlay
} from "@fortawesome/free-solid-svg-icons";
//App Components
import HeaderContainer from "./containers/HeaderContainer";
import HomeContainer from "./containers/HomeContainer";
import MovieContainer from "./containers/MovieContainer";
import MoviesContainer from "./containers/MoviesContainer";
import RatingsContainer from "./containers/RatingsContainer";
import PlaylistContainer from "./containers/PlaylistContainer";
import PlaylistsContainer from "./containers/PlaylistsContainer";
import SearchContainer from "./containers/SearchContainer";
import SignInContainer from "./containers/SignInContainer";
import SignUpContainer from "./containers/SignUpContainer";
import UserContainer from "./containers/UserContainer";

library.add(
  faSignOutAlt,
  faBars,
  faUser,
  faFilm,
  faStar,
  faStepForward,
  faPlay
);

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
            <Route
              path="/ms/movies/:type/:query?/:desc?/:end?"
              component={MoviesContainer}
            />
            <Route path="/ms/movie/:id" component={MovieContainer} />
            <Route path="/ms/ratings" component={RatingsContainer} />
            <Route path="/ms/search" component={SearchContainer} />
            <Route path="/ms/playlists" component={PlaylistsContainer} />
            <Route path="/ms/playlist/:id" component={PlaylistContainer} />
            <Route path="/ms/users/:id" component={UserContainer} />
          </Switch>
        </header>
      </div>
    );
  }
}

export default App;
