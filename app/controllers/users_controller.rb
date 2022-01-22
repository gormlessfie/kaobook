class UsersController < ApplicationController
  def index
    @users = User.all.order(username: :asc)
    @result = User.where('username LIKE ?', "%#{params[:query]}%") if params[:query]
  end

  def show
    @user = User.find(params[:id])
  end
end
