# == Schema Information
#
# Table name: continents
#
#  id           :bigint           not null, primary key
#  denomination :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :continent do
    denomination { ['America', 'Asia', 'Africa', 'Europe', 'Oceania', 'Antarctica'].sample }
  end
end
