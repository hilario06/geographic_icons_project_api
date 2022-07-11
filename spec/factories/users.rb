FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    age { rand(18..100) }
    password_digest { Faker::Internet.password(min_length: 10, max_length: 20) }
  end
end
