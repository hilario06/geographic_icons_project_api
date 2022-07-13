FactoryBot.define do
  factory :token do
    user { nil }
    token { "MyString" }
    expires_at { "2022-07-13 14:41:07" }
  end
end
