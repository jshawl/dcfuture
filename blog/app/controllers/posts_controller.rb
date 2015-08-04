class PostsController < ApplicationController
  skip_before_action :authenticate, except: [:new, :edit]

  def index
    if params[:section]
      @posts = Post.where(:section => params[:section])
    else
      @posts = Post.all.order(:timestamp).reverse
    end
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(session[:user]["id"])
    @post = @user.posts.create!( post_params )
    @post.update( timestamp: Time.now.strftime("%b %e %Y, %l:%M%P") )
    redirect_to (post_path(@post))
  end

  def show
    @post = Post.find( params[:id] )
    @user = @post.user
  end

  def edit
    @post = Post.find( params[:id] )
    @user = User.find(session[:user]["id"])
    if @user != @post.user
      redirect_to (post_path(@post))
      flash[:notice] = "Sorry, you cannot edit another user's post!"
    end
  end

  def update
    @post = Post.find( params[:id] )
    @post.update( post_params )
    @post.update( timestamp: Time.now.strftime("%b %e %Y, %l:%M%P") )
    redirect_to @post
  end

  def destroy
    @post = Post.find( params[:id] )
    @post.destroy

    redirect_to posts_path
  end

# workaround to be able to post new post
  private
    def post_params
      params.require(:post).permit(:title, :summary, :body, :upload_url, :user, :section)
    end

end
