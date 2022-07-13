# == Schema Information
#
# Table name: continents
#
#  id           :bigint           not null, primary key
#  denomination :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Continent < ApplicationRecord
  has_many :countries, dependent: :destroy
  has_many :cities, through: :countries
  has_many :geographic_icons, through: :cities
end
