class Profile < ApplicationRecord
  belongs_to :user

  has_one :detail, dependent: :destroy
end
