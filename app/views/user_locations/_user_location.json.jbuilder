json.extract! user_location, :id, :address, :max_distance, :created_at, :updated_at
json.url user_location_url(user_location, format: :json)
