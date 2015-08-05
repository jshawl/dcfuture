class HomeController < ApplicationController

  def profile
    if session[:user]
      redirect_to user_path(current_user)
    else
      redirect_to action: :sign_in
    end
  end

end
