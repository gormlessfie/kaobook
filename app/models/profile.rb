class Profile < ApplicationRecord
  belongs_to :user

  has_one :detail, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
end
