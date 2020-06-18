import * as APIUtil from '../util/session_api_util'

// login(user) (thunk action creator)
// logout() (thunk action creator)
// signup(user) (thunk action creator)

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";

export const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER
});

export const receiveErrors = (errors) => ({
    type: RECEIVE_ERRORS,
    error
});