class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user
  skip_before_action :verify_authenticity_token

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token]) 
  end

  def require_login
    unless current_user
        render json: ['need login'], status: 401
    end
  end

  def logged_in?
    !!current_user
  end   

  def login(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    @current_user = user
  end

  def logout
    current_user.reset_session_token! #DB SIDE. WHY NOT current_user.session_token = nil
    @current_user = nil
    session[:session_token] = nil
  end
end
