class Train < ApplicationRecord
    has_many :ticket, dependent: :destroy
    has_many :review, dependent: :destroy
    validates :train_num, presence: true, format: { with: /\A\d+\z/, message: "only allows numbers", greater_than_or_equal_to: 0 }
    validates :departure_date, presence: true
    validates :departure_st, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "should be only alphabets" }
    validates :departure_time, presence: true
    validates :terminal_st, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "should be only alphabets" }
    validates :arrival_date, presence: true
    validates :arrival_time, presence: true
    validates :ticket_price, presence: true, numericality: {greater_than_or_equal_to: 0}
    validates :train_capacity, presence: true, numericality: {greater_than_or_equal_to: 0}
    validates :seats_left, presence: true, numericality: { less_than_or_equal_to: :train_capacity, greater_than_or_equal_to: 0 }
end
