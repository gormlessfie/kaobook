class ApplicationController < ActionController::Base
  def generate_profile
    current_user.create_profile
  end
end
