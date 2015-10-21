class PostsController < ApplicationController
  before_action :find_post, only:[:show, :edit, :update, :destroy]
  # do th find post method only for those methods


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

  def edit
  end

  def update
    #so if we have clicked the button to update,
    #then update else you are still editing
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def find_post
      @post = Post.find(params[:id])
  end
  # needs a post and allows a title/content
  def post_params
    params.require(:post).permit(:title, :content)
  end

end
