# == Schema Information
#
# Table name: countries
#
#  id                    :bigint           not null, primary key
#  denomination          :string
#  number_of_inhabitants :integer          default(0)
#  totat_surface_area    :float
#  continent_id          :bigint           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
FactoryBot.define do
  factory :country do
    denomination { Faker::Address.country }
    number_of_inhabitants { rand(1000..10000) }
    totat_surface_area { rand(1000..10000) }
    continent
  end
end
