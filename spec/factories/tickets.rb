FactoryBot.define do
    factory :ticket do
      confirm_num { 1234567890 }
      association :passenger, factory: :passenger
      association :train, factory: :train
      quantity { 1 } 
      cost { 50.0 }  
      other_id { nil } 
      end
  end
  