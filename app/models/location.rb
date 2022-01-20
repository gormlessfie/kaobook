class Location < ApplicationRecord
  belongs_to :detail

  validates :address, presence: true, length: { maximum: 100 }
  validates :state, presence: true, length: { maximum: 50 }
  validates :city, presence: true, length: { maximum: 50 }
  validates :country, presence: true, length: { maximum: 50 }
  validates :zip, presence: true, length: { maximum: 10 }, numericality: { only_integer: true }
end
