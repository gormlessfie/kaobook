class Gender < ApplicationRecord
  belongs_to :detail

  validates :gender, presence: true, inclusion: { %w(male female non-binary other) }
end
