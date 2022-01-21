class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user: current_user, post: params[:id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.where(user: current_user, post: post_id)
    @like.destroy
  end

  private

  def like_params
    params.require(:like).permit()
  end
end
