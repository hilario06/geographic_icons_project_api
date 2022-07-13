# == Schema Information
#
# Table name: tokens
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  token      :string
#  expires_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :token do
    token { SecureRandom.hex }
    expires_at { Faker::Date.in_date_period }
  end
end
