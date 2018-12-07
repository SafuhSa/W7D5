class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def login(user)
    @current_user = user
    session[:session_token] = @current_user.reset_session_token
  end

  def logout
    session[:session_token] = nil
    current_user.reset_session_token
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_login
    unless logged_in?
      render json: { base: ['invalid credentials'] }, status: 401
    end
  end

  def logged_in?
    !!current_user
  end


end
