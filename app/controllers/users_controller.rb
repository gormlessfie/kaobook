class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    current_user ? @user = current_user : @user = User.find(params[:id])

    @post = Post.new
    @posts = @user.posts.includes(:comments, :likes, :user)
    
    @comment = Comment.new
  end
end
