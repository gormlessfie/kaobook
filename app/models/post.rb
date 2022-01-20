class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  has_one :description, as: :describable, dependent: :destroy
  has_one :like_counter, dependent: :destroy
end
