json.array!(@shops) do |shop|
  json.extract! shop, :id, :name, :subdomain, :user_id
  json.url shop_url(shop, format: :json)
end
