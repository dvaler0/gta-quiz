class Result < ApplicationRecord
  belongs_to :challenge

  validates :lives, numericality: { less_than_or_equal_to: 5, more_than_or_equal_to: 0 }
end
