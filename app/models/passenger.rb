class Passenger < ApplicationRecord
    has_secure_password
    has_many :ticket, dependent: :destroy
    has_many :review, dependent: :destroy
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "is not a valid email address" }
    validates :name, presence: true
    validates :password, presence: true, if: :password_required?
    validates :phone_num, numericality: { only_integer: true }, length: { is: 10, message: "must be 10 digits long" }
    validates :card_num, numericality: {only_integer: true}, length: { is: 16, message: "must be 10 digits long" }
    def password_required?
        # Add conditions here to determine if password is required.
        # For example, check if it's a new record or if a new password is provided.
        # If yes, return true; if no, return false.
        new_record? || !password.blank?
    end
end

