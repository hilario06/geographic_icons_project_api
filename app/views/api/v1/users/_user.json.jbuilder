json.extract! user, :id, :email, :age, :created_at, :updated_at
json.token do
  json.partial! 'api/v1/tokens/token', token: @token
end
