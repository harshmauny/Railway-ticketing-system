class Review < ApplicationRecord
    has_one :train
    has_one :passenger
    belongs_to :passenger
    belongs_to :train
    validates :feedback, presence: true
    validates :rating, numericality: { in: 1..5, only_integer: true }
end
