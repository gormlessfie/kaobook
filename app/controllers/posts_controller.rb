class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user

    @post = Post.new
    @posts = @user.posts.includes(:comments, :likes, :user)
    
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:succes] = 'Post successful'
      redirect_to posts_path
    else
      flash[:error] = 'Post must contain something.'
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    flash[:success] = 'Post deleted.'
    redirect_to posts_path
  end

  private
  
  def post_params
    params.require(:post).permit(:body)
  end
end
