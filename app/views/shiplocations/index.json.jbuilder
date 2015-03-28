json.array!(@shiplocations) do |shiplocation|
  json.extract! shiplocation, :id, :country, :price, :cost, :listing_id
  json.url shiplocation_url(shiplocation, format: :json)
end
