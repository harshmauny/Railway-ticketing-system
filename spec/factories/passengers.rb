FactoryBot.define do
    factory :passenger do
      username { "user" }
      name { "User" }
      email { "test@example.com" }
      password { "valid_password" } 
      phone_num { "1234567890" }  
      card_num { "1234567890123456" }     
      is_admin { false }      
    end
  end
  
  