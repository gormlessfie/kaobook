class UsersController < ApplicationController
  def index
    @users = User.all.order(username: :asc)
      .includes(:pending_friendships, :inverse_pending_friendships)

    @result = User.where('username LIKE ?', "%#{params[:query]}%")
      .order(username: :asc).includes(:pending_friendships, :inverse_pending_friendships) if params[:query]
  end

  def show
    @user = User.find(params[:id])
    @friends = @user.accepted_friends + @user.inverse_accepted_friends
    @posts = Post.where(user_id: @friends).includes(:user)
  end
end
