class FriendshipsController < ApplicationController
  def create
    user = current_user
    user.friendships.build(friend_id: params[:friend].to_i)

    if user.save
      flash[:success] = 'Friend request sent!'
    else
      flash[:error] = 'Friend request already sent!'
    end

    redirect_to request.referer
  end
  
  def update
    friendship = Friendship.find(params[:id])
    friendship.update(active: true)

    flash[:success] = 'Friendship request accepted.'
    redirect_to request.referer
  end

  def destroy
    friendship = Friendship.find(params[:id])
    flash[:success] = 'Removed friend.'
    friendship.destroy

    redirect_to request.referer
  end
end
