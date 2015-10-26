class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:comment))
    #you get the post and then create a comment allowing a comment
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end




end
