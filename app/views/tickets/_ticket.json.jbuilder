json.extract! ticket, :id, :confirm_num, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
