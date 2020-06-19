import { connect } from 'react-redux';
import SessionForm from './session_form';
import { signup } from '../../actions/session_actions';
import { Link, NavLink } from 'react-router-dom';
import React from 'react';

const mSTP = (state) => ({
    errors: state.errors.session,
    formType: "Sign Up",
    navLink: <Link to="/login"> Log In </Link>
});

const mDTP = (dispatch) => ({
    processForm: (user) => dispatch(signup(user))
});

export default connect(mSTP, mDTP)(SessionForm);