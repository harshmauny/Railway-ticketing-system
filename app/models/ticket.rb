class Ticket < ApplicationRecord
    has_one :passenger
    has_one :train
    belongs_to :passenger
    belongs_to :train
end
