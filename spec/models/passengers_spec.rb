require 'rails_helper'

RSpec.describe Passenger, type: :model do
  context "validations" do
    it "is valid with valid attributes" do
      passenger = FactoryBot.build(:passenger) 
      expect(passenger).to be_valid
    end

    it "is not valid without a username" do
      passenger = FactoryBot.build(:passenger, username: nil)
      expect(passenger).to_not be_valid
    end

    it "is not valid without a unique username" do
      existing_passenger = FactoryBot.create(:passenger)
      new_passenger = FactoryBot.build(:passenger, username: existing_passenger.username)
      expect(new_passenger).to_not be_valid
    end

    it "is not valid without a valid email" do
      passenger = FactoryBot.build(:passenger, email: "invalid-email")
      expect(passenger).to_not be_valid
    end
  
    it "is not valid without a name" do
      passenger = FactoryBot.build(:passenger, name: nil)
      expect(passenger).to_not be_valid
    end
  
    it "is not valid without a password" do
      passenger = FactoryBot.build(:passenger, password: nil)
      expect(passenger).to_not be_valid
    end
  
    it "is not valid with a short phone number" do
      passenger = FactoryBot.build(:passenger, phone_num: "12345")
      expect(passenger).to_not be_valid
    end
  
    it "is not valid with a non-integer phone number" do
      passenger = FactoryBot.build(:passenger, phone_num: "abc123")
      expect(passenger).to_not be_valid
    end
  
    it "is not valid with a short card number" do
      passenger = FactoryBot.build(:passenger, card_num: "1234")
      expect(passenger).to_not be_valid
    end
  
    it "is not valid with a non-integer card number" do
      passenger = FactoryBot.build(:passenger, card_num: "abcd1234")
      expect(passenger).to_not be_valid
    end
  end
end
