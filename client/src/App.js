import React, { Component } from 'react'
import { Route, Switch } from 'react-router-dom'
import './App.css'
//font awesome
import { library } from '@fortawesome/fontawesome-svg-core'
import {
    faSignOutAlt,
    faBars,
    faLock,
    faUser,
    faFilm,
    faStar,
    faStepForward,
    faPlay,
    faUpload,
} from '@fortawesome/free-solid-svg-icons'
//App Components
import Admin from './components/Admin'
import HeaderContainer from './containers/HeaderContainer'
import HomeContainer from './containers/HomeContainer'
import MovieContainer from './containers/MovieContainer'
import MoviesContainer from './containers/MoviesContainer'
import RatingsContainer from './containers/RatingsContainer'
import PlaylistContainer from './containers/PlaylistContainer'
import PlaylistsContainer from './containers/PlaylistsContainer'
import PrivateRoute from './HOC/PrivateRoute'
import ResetPasswordContainer from './containers/ResetPasswordContainer'
import SignInContainer from './containers/SignInContainer'
import SignUpContainer from './containers/SignUpContainer'
import UserContainer from './containers/UserContainer'
import MediaUpdate from './components/MediaUpdate'
import PersonContainer from './containers/PersonContainer'

import Fix from './components/Fix'

library.add(
    faSignOutAlt,
    faBars,
    faUser,
    faLock,
    faFilm,
    faStar,
    faStepForward,
    faPlay,
    faUpload
)

class App extends Component {
    render() {
        return (
            <div className="App">
                <Route exact path="/" component={HomeContainer} />
                <header className="App-header">
                    <Route path="/ms" component={HeaderContainer} />
                </header>
                <Switch>
                    <Route path="/ms/sign-up" component={SignUpContainer} />
                    <Route path="/ms/sign-in" component={SignInContainer} />
                    <Route
                        path="/ms/reset_password/:id/:pass"
                        component={ResetPasswordContainer}
                    />
                    <PrivateRoute path="/ms/admin" component={Admin} />
                    <PrivateRoute
                        path="/ms/movies/:type/:query?/:desc?/:end?"
                        component={MoviesContainer}
                    />
                    <PrivateRoute
                        path="/ms/movie/:id"
                        component={MovieContainer}
                    />
                    <PrivateRoute
                        path="/ms/ratings"
                        component={RatingsContainer}
                    />
                    <PrivateRoute
                        path="/ms/person/:id"
                        component={PersonContainer}
                    />
                    <PrivateRoute
                        path="/ms/playlists"
                        component={PlaylistsContainer}
                    />
                    <PrivateRoute
                        path="/ms/playlist/:id"
                        component={PlaylistContainer}
                    />
                    <PrivateRoute
                        path="/ms/users/:id"
                        component={UserContainer}
                    />
                    <Route path="/ms/media_update" component={MediaUpdate} />
                    <Route path="/ms/fix" component={Fix} />
                </Switch>
            </div>
        )
    }
}

export default App
//
