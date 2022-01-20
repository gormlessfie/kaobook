class Description < ApplicationRecord
  belongs_to :describable, polymorphic: true

  validates :body, presence: true, length: { maximum: 500 }
end
