class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id if current_user
    @comment.save
    # you need to save the comment
    #you get the post and then create a comment allowing a comment
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end


  def update
    #so if we have clicked the button to update,
    #then update else you are still editing
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  
end
