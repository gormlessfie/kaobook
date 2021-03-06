class UsersController < ApplicationController
  def index
    @users = User.all.order(username: :asc)
      .includes(:pending_friendships, :inverse_pending_friendships)

    @result = User.where('username LIKE ?', "%#{params[:query]}%")
      .order(username: :asc).includes(:pending_friendships, :inverse_pending_friendships) if params[:query]
  end

  def show
    @user = User.find(params[:id])

    @posts = Post
      .where(user: @user)
      .includes(:user, { user: { profile: { detail: :name }}}, :likes,
                :comments, { comments: { user: { profile: { detail: :name, avatar_attachment: :blob }}}})
      .order(created_at: :desc)
    
    @post = Post.new
    @comment = Comment.new
  end
end
