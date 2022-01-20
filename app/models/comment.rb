class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  has_one :description, as: :describable, dependent: :destroy
end
