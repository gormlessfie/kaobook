class Age < ApplicationRecord
  belongs_to :detail

  validates :age, presence: true, numericality: { only_integer: true,
                                                  greater_than_or_equal_to: 1,
                                                  less_than_or_equal_to: 150,
                                                  message: 'must be between 1 and 150' }
end
