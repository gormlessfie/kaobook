class FriendshipsController < ApplicationController
  def create
    user = current_user
    user.friendships.build(friend_id: params[:friend].to_i)

    if user.save
      flash[:success] = 'Friend invitation sent!'
    else
      flash[:error] = 'Friend invitation already sent!'
    end

    redirect_to request.referer
  end

  def destroy
  end
end
