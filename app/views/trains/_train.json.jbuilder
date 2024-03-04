json.extract! train, :id, :train_num, :departure_st, :terminal_st, :departure_date, :departure_time, :arrival_date, :arrival_time, :ticket_price, :train_capacity, :seats_left, :created_at, :updated_at
json.url train_url(train, format: :json)
