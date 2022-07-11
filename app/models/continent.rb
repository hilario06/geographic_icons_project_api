class Continent < ApplicationRecord
  has_many :countries, dependent: :destroy
  has_many :cities, through: :countries
  has_many :geographic_icons, through: :countries
end
