class City < ApplicationRecord
  belongs_to :country
  has_many :geographic_icons, dependent: :destroy
end
