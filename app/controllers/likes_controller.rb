class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user: current_user, post: params[:id])
    redirect_to user_path(@post.user)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to user_path(@post.user)
  end

  private

  def like_params
    params.require(:like).permit()
  end
end
