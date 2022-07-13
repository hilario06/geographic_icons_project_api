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
    denomination { "MyString" }
    number_of_inhabitants { 1 }
    totat_surface_area { 1.5 }
    references { "" }
  end
end
