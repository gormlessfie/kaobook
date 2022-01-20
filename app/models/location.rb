class Location < ApplicationRecord
  belongs_to :detail

  validates :address, length: { maximum: 100 }
  validates :state, length: { maximum: 50 }
  validates :city, length: { maximum: 50 }
  validates :country, length: { maximum: 50 }
  validates :zip, length: { maximum: 10 }, numericality: { only_integer: true }
end
