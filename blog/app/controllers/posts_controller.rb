class PostsController < ApplicationController

  def index
    @posts = Post.all.order(:id).reverse
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(session[:user]["id"])
    @post = @user.posts.create!( post_params )
    @post.update( date_posted: Time.now.strftime("%b %e %Y, %l:%M%P") )
    redirect_to (post_path(@post))
  end

  def show
    @post = Post.find( params[:id] )
  end

  def edit
    @post = Post.find( params[:id] )
  end

  def update
    @post = Post.find( params[:id] )
    @post.update( post_params )

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
      params.require(:post).permit(:title, :summary, :body, :upload_url, :user)
    end

end
