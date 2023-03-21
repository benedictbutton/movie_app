// import "babel-polyfill";
import React from 'react'
import ReactDOM from 'react-dom'
import { BrowserRouter as Router } from 'react-router-dom'
import './index.css'
import App from './App'
import { Provider } from 'react-redux'
import CssBaseline from '@material-ui/core/CssBaseline'
import { store } from './redux/store/configureStore'
import * as serviceWorker from './serviceWorker'
import './util/fonts/Starjedi.ttf'

ReactDOM.render(
    <div>
        <CssBaseline />
        <Provider store={store}>
            <Router>
                <App />
            </Router>
        </Provider>
    </div>,
    document.getElementById('root')
)

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: http://bit.ly/CRA-PWA
serviceWorker.unregister()
