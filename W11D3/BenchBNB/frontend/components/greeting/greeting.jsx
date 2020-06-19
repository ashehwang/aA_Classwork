import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = ({ currentUser, logout }) => {

    const sessionLinks = () => (
        <nav>
            <Link to="/login"> Log In </Link>
            <Link to="/signup"> Sign Up </Link>
        </nav>
    );

    const personalGreeting = () => (
        <nav>
            <h2> Hello, { currentUser.username }!!</h2>
            <button onClick={logout}> Log Out </button>
        </nav>
    );

    return currentUser ? personalGreeting() : sessionLinks();
};

export default Greeting;