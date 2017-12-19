json.extract! encrypted, :id, :message, :created_at, :updated_at
json.url encrypted_url(encrypted, format: :json)
