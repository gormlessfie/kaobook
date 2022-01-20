class Description < ApplicationRecord
  belongs_to :describable, polymorphic: true

  validates :body, presence: true, length: { in: 1..500 }
end
