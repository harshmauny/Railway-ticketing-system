json.extract! passenger, :id, :username, :name, :email, :password, :phone_num, :address, :card_num, :created_at, :updated_at
json.url passenger_url(passenger, format: :json)
