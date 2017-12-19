json.extract! decrypted, :id, :message, :created_at, :updated_at
json.url decrypted_url(decrypted, format: :json)
