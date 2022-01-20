class Detail < ApplicationRecord
  belongs_to :profile

  has_one :location
  has_one :age
  has_one :contact_information
  has_one :gender
  has_one :name
end
