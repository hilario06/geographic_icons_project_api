FactoryBot.define do
  factory :country do
    denomination { "MyString" }
    number_of_inhabitants { 1 }
    totat_surface_area { 1.5 }
    references { "" }
  end
end
