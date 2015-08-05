class UsersController < ApplicationController
  skip_before_action :authenticate, except: [:new, :edit]

#CRUD functionality
  def index
    @users = User.all.order(:id).reverse
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

#authentication
  def sign_up
  end

  def sign_up!
    user = User.new(
      username: params[:username],
      password_digest: BCrypt::Password.create(params[:password])
    )
    if params[:password_confirmation] != params[:password]
      message = "Your passwords don't match!"
      redirect_to action: :sign_up
    elsif user.save
      cookies[:username] = {
        value: @user.username,
        expires: 100.years.from_now
      }
      session[:user] = @user
      message = "Your account has been created, #{@user.username}!"
      redirect_to (new_user_path(@user))
    else
      message = "Your account couldn't be created. Did you enter a unique username and password?"
      redirect_to (action: :sign_up)
    end
    flash[:notice] = message
  end

  def sign_in
  end

  def sign_in!
    @user = User.find_by(username: params[:username])
    if !@user
      message = "This user doesn't exist!"
    elsif !BCrypt::Password.new(@user.password_digest).is_password?(params[:password])
      message = "Sorry, wrong password!"
    else
      message = "You're signed in, #{@user.username}!"
      cookies[:username] = {
        value: @user.username,
        expires: 100.years.from_now
      }
      session[:user] = @user
    end
    flash[:notice] = message
    redirect_to root_url
  end

  def sign_out
    reset_session
    redirect_to root_url
    flash[:notice] = "You're signed out!"

  end

end
