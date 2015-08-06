class TagsController < ApplicationController

  def index
    @tags = Tag.all.order(:name)
  end

  def show
    @tag = Tag.find_by(params[:name])
    @users = User.tagged_with(params[:tag])
    @posts = Post.tagged_with(params[:tag])    
  end

end
