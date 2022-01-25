class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(user: current_user, body: comment_params[:body])

    if @comment.save
      flash[:success] = 'Comment posted.'
      redirect_to request.referer
    else
      flash[:error] = 'There was an error posting the comment.'
      redirect_to request.referer
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    redirect_to request.referer
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
