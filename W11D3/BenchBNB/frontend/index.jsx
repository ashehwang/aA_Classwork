import React from 'react';
import ReactDOM from 'react-dom';
import { signup, login, logout } from './util/session_api_util'

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById("root");
  ReactDOM.render(<h1>Hello World</h1>, root)
  window.login = login;
  window.signup = signup;
  window.logout = logout;
})
