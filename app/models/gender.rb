class Gender < ApplicationRecord
  belongs_to :detail

  validates :gender, inclusion: { in: %w(male female non-binary other) }
end
