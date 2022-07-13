# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  age             :integer
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    age { rand(18..100) }
    password_digest { Faker::Internet.password(min_length: 10, max_length: 20) }
  end
end
