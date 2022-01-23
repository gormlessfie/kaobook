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
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @detail = current_user.profile.detail
  end

  def update
    @user = current_user
    @detail = current_user.profile.detail

    if @detail.update(detail_params)
      flash[:success] = 'Profile information updated successfully.'
      redirect_to user_path(@user)
    else
      flash[:error] = 'There are some errors'
      render :edit
    end
  end

  private

  def detail_params
    # name age contact information location gender
    params.require(:detail).permit(name_attributes: [:fname, :lname],
                                   age_attributes: [:dob],
                                   gender_attributes: [:gender],
                                   contact_information_attributes: [:phone_number],
                                   location_attributes: [:address, :state, :city, :country, :zip])
  end
end
