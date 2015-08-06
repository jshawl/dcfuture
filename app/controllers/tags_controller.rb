class TagsController < ApplicationController

  def index
    @tags = Tag.all.order(:name)
  end

  def show
    @tag = Tag.find(params[:id])
    @users = @tag.users
    # @posts = @tag.posts
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def tag_params
      params.require(:tag).permit(:name, :tag_list)
    end
end
