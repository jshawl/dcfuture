class CommentsController < ApplicationController
  before_action :authenticate, only: [:new, :create, :edit, :update, :destroy]

  def index
    @comments = Comment.all.order(:timestamp).reverse
    @post = @comment.post
    @user = @comment.user
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create( comment_params )
    @comment.update( user: current_user)
    @comment.update( timestamp: Time.now.strftime("%b %e %Y, %l:%M%P") )
    redirect_to post_comment_path(@post, @comment)
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find( params[:id] )
    @post_user = @post.user
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find( params[:id] )
    @user = current_user
    if @user != @comment.user
      # in the future, take a look at a gem like CanCanCan to handle authorization
      redirect_to (post_comment_path(@post, @comment))
      flash[:notice] = "Sorry, you cannot edit another user's comment!"
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find( params[:id] )
    @comment.update( comment_params )
    # see comment below in strong params
    @comment.update( timestamp: Time.now.strftime("%b %e %Y, %l:%M%P") )
    redirect_to post_comment_path(@post, @comment)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find( params[:id] )
    @comment.destroy
    redirect_to @post
  end

  private
  def comment_params
    params.require(:comment).permit(:user, :title, :body, :timestamp, :post)
    # consider getting the post from the URL, and not what is POSTed in the params.
  end

end
