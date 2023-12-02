class Challenge < ApplicationRecord
  has_one :song
  has_many :result
end
