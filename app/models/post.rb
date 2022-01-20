class Post < ApplicationRecord
  belongs_to :user

  has_many :comments

  has_one :description, as: :describable
end
