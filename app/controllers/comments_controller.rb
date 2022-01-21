class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(user: current_user, body: comment_params[:body])

    if @comment.save
      flash[:success] = 'Comment posted.'
      redirect_to user_path(current_user)
    else
      flash[:error] = 'There was an error posting the comment.'
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @user = @comment.post.user
    redirect_to user_path(@user)
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
