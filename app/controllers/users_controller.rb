class UsersController < ApplicationController
  before_action :authenticate, only: [:new, :create, :edit, :update, :destroy]

#CRUD functionality
  def index
    if params[:dc_voter]
      @users = User.where(:dc_voter => params[:dc_voter])
    else
      @users = User.all.order(:id).reverse
    end
  end

  def new
    @user = current_user
  end

  def create
    @user = current_user
    @user.update( user_params )
    redirect_to ("/")
  end

  def show
    @user = User.find( params[:id] )
    @current_user = User.find(session[:user]["id"])
    @posts = @user.posts.order(:timestamp).reverse
  end

  def edit
    @user = User.find( params[:id] )
    if @user != current_user
      redirect_to (@user)
      flash[:notice] = "Sorry, you cannot edit another user's profile!"
    end
  end

  def update
    @user = User.find( params[:id] )
    @user.update( user_params )
    redirect_to (@user)
  end

  def destroy
    @user = User.find( params[:id] )
    if @user != current_user
      redirect_to (@user)
      flash[:notice] = "Sorry, you cannot delete another user's profile!"
    else
      @user.destroy
      reset_session
      redirect_to root_url
      flash[:notice] = "Sorry to See You Go!"
    end
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
    @user = User.find_by(username: params[:username])
      cookies[:username] = {
        value: @user.username,
        expires: 100.years.from_now
      }
      session[:user] = @user
      message = "Your account has been created, #{@user.username}!"
      @user.update( join_date: Time.now.strftime("%B %e, %Y") )
      redirect_to (new_user_path(@user))
    else
      message = "Your account couldn't be created. Did you enter a unique username and password?"
      redirect_to action: :sign_up
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

  private
    def user_params
      params.require(:user).permit(:username, :password_digest, :full_name, :email, :occupation_type, :age, :dc_voter, :zip, :ward, :upload_pic)
    end


end
