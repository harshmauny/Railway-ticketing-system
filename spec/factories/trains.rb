FactoryBot.define do
    factory :train do
      train_num { 123 }
      departure_st { "StationA" }
      terminal_st { "StationB" }
      departure_date { "2023-09-27" }
      departure_time { "14:38:52" }
      arrival_date { "2023-09-27" }
      arrival_time {"14:38:52" }
      ticket_price { 50.0 }
      train_capacity { 100 }
      seats_left { 100 }
    end
  end