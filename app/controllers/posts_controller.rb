class PostsController < ApplicationController
  def index
  end

  # user arrives at this page
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  # if we create a post and able to save
  # then redirect to the post show page
  # else you render to new
  # click button to save with set params
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  private

  # needs a post and allows a title/content
  def post_params
    params.require(:post).permit(:title, :content)
  end

end
