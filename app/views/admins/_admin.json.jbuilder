json.extract! admin, :id, :username, :name, :email, :password, :phone_num, :address, :card_num, :created_at, :updated_at
json.url admin_url(admin, format: :json)
