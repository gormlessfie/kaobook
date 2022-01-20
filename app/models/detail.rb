class Detail < ApplicationRecord
  belongs_to :profile

  has_one :location, dependent: :destroy
  has_one :age, dependent: :destroy
  has_one :contact_information, dependent: :destroy
  has_one :gender, dependent: :destroy
  has_one :name, dependent: :destroy
end
