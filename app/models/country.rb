class Country < ApplicationRecord
  belongs_to :continent
  has_many :cities, dependent: :destroy
  has_many :geographic_icons, through: :cities
end
