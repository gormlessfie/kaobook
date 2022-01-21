class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = current_user.posts.build(post_params)

    if @post.save!
      flash[:succes] = 'Post successful'
      redirect_to user_path(current_user)
    else
      flash[:error] = 'Post must contain something.'
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    flash[:success] = 'Post deleted.'
    redirect_to user_path(current_user)
  end

  private
  
  def post_params
    params.require(:post).permit(:body)
  end
end
