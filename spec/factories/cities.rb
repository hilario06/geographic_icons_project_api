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
    denomination { Faker::Address.city }
    number_of_inhabitants { rand(1000..10000) }
    totat_surface_area { rand(1000..10000) }
    country
  end
end
