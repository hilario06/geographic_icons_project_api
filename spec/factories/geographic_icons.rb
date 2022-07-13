# == Schema Information
#
# Table name: geographic_icons
#
#  id               :bigint           not null, primary key
#  denomination     :string
#  date_of_creation :date
#  height           :float
#  history          :text
#  city_id          :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
FactoryBot.define do
  factory :geographic_icon do
    denomination { "MyString" }
    date_of_creation { "2022-07-11" }
    height { 1.5 }
    history { "MyText" }
    city { nil }
  end
end
