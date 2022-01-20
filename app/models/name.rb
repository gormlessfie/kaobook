class Name < ApplicationRecord
  belongs_to :detail

  validates :fname, presence: true, length: { in: 1..24 }
  validates :lname, presence: true, length: { in: 1..24 }
end
