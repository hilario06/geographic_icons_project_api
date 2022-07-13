# == Schema Information
#
# Table name: cities
#
#  id                    :bigint           not null, primary key
#  denomination          :string
#  number_of_inhabitants :integer          default(0)
#  totat_surface_area    :float
#  country_id            :bigint           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
FactoryBot.define do
  factory :city do
    denomination { "MyString" }
    number_of_inhabitants { 1 }
    totat_surface_area { 1.5 }
    country { nil }
  end
end
