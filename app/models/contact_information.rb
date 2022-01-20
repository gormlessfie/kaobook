class ContactInformation < ApplicationRecord
  validates :phone_number, presence: true
end
