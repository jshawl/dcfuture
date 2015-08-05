class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    return User.find(session[:user]["id"]) if session[:user]
  end

  private
  def authenticate
    if !session[:user]
      redirect_to "/sign_in"
    end
  end

end
