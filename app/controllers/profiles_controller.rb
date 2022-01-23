class ProfilesController < ApplicationController
  def show
    @profile = User.find(params[:id]).profile.includes(detail: [:age, :location, :gender, :contact_information, :name])
  end
end
