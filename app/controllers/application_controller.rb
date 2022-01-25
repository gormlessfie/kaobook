class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :incoming_friendships, if: proc { user_signed_in? }

  def incoming_friendships
    @requests = Friendship.where(friend: current_user).where(active: false).includes(:user)
  end

  def generate_profile
    current_user.create_profile
  end
end
