import { connect } from 'react-redux';
import SessionForm from './session_form';
import { login } from '../../actions/session_actions';
import { Link } from 'react-router-dom';
import React from 'react';

const mSTP = (state) => ({
    errors: state.errors.session,
    formType: "Log In",
    navLink: <Link to="/signup"> Sign Up </Link>
});

const mDTP = (dispatch) => ({
    processForm: (user) => dispatch(login(user))
});

export default connect(mSTP, mDTP)(SessionForm);