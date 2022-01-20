class Location < ApplicationRecord
  belongs_to :detail

  validates :address, presence: true, length: { in: 1..200 }
  validates :state, presence: true, length: { in: 1..50 }
  validates :city, presence: true, length: { in: 1..100 }
  validates :country, presence: true, length: { in: 1..100 }
  validates :zip, presence: true, length: { in: 1..10 }, numericality: { only_integer: true }
end
