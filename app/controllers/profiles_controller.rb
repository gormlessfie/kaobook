class ProfilesController < ApplicationController
  def show
    @profile = User.find(params[:user_id]).profile
  end

  def update
    @profile = current_user.profile

    if @profile.update(profile_params)
      flash[:success] = 'Profile picture uploaded.'
      redirect_to user_profile_path(current_user)
    else
      flash[:error] = 'Failed to upload profile picture.'
      redirect_to user_profile_path(current_user)
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:avatar)
  end
end
