FactoryBot.define do
  factory :city do
    denomination { "MyString" }
    number_of_inhabitants { 1 }
    totat_surface_area { 1.5 }
    country { nil }
  end
end
