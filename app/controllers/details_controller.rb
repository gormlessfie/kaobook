class DetailsController < ApplicationController
  def new
    @user = current_user
    @detail = @user.profile.build_detail

    @user.profile.detail.build_name
    @user.profile.detail.build_gender
    @user.profile.detail.build_age
    @user.profile.detail.build_location
    @user.profile.detail.build_contact_information
  end

  def create
    @user = current_user
    @detail = @user.profile.build_detail(detail_params)

    if @detail.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def detail_params
    # name age contact information location gender
    params.require(:detail).permit()
  end
end
