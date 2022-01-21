class Detail < ApplicationRecord
  belongs_to :profile

  has_one :location, dependent: :destroy
  has_one :age, dependent: :destroy
  has_one :contact_information, dependent: :destroy
  has_one :gender, dependent: :destroy
  has_one :name, dependent: :destroy

  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :age
  accepts_nested_attributes_for :contact_information
  accepts_nested_attributes_for :gender
  accepts_nested_attributes_for :name
end
