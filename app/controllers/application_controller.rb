class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authorize

  def authorize
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      user = User.create
      @current_user = user
      session[:user_id] = user.id
    end
  end
end
