class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    current_user ? @user = current_user : @user = User.find(params[:id])

    @post = Post.new
    @posts = @user.posts.includes(:comments)
    
    @comment = Comment.new
  end
end
