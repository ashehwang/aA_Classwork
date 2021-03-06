import React from 'react';
import ReactDOM from 'react-dom';
import { signup, login, logout } from './actions/session_actions';
import configureStore from './store/store';
import Root from "./components/root";

import { fetchBenches } from './actions/bench_action';


document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById("root");
  let store;

  if (window.currentUser) {
    const preloadedState = {
      session: { id: window.currentUser.id },
      entities: {
        users: { [window.currentUser.id]: window.currentUser }
      }
    };
    store = configureStore(preloadedState);
    delete window.currentUser;
  } else {
    store = configureStore();
  }

  ReactDOM.render(<Root store={store} />, root)
  
  window.dispatch = store.dispatch;
  window.getState = store.getState;
  window.login = login;
  window.signup = signup;
  window.logout = logout;
  window.fetchBenches = fetchBenches;
});
