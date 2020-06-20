import React from 'react';
import { Provider } from 'react-redux';
import { Route, Redirect, Switch, Link, HashRouter } from 'react-router-dom';
import GreetingContainer from './greeting/greeting_container';
import LogInFormContainer from './session_form/login_form_container';
import SignUpFormContainer from './session_form/signup_form_container';
import { AuthRoute } from '../util/route_util';
import BenchIndexContainer from './bench_index_container';
import SearchContainer from './search_container'

const App = () => (
    <div>
        <header>
            <Link to="/">
                <h1>Bench BnB; this is from APP file </h1>
            </Link>
                <GreetingContainer />
        </header>
        <Switch>
            <AuthRoute exact path="/login" component={LogInFormContainer} />
            <AuthRoute exact path="/signup" component={SignUpFormContainer} />
            <Route exact path="/" component={SearchContainer}/>
        </Switch>
    </div>
)

export default App;