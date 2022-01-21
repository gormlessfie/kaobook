class LikeCounter < ApplicationRecord
  belongs_to :post

  validates :likes, presence: true
end
