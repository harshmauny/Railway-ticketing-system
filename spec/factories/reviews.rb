# In spec/factories/reviews.rb

FactoryBot.define do
    factory :review do
      rating { 5 }
      feedback { "This is a great review." }
      train_id { 1 }   
      name { "User" } 
      train_num { 123 } 
      association :passenger, factory: :passenger
      association :train, factory: :train
    end
  end  