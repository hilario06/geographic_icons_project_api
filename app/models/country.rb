class Country < ApplicationRecord
  belongs_to :continent
  has_many :cities, dependent: :destroy
  has_many :geographic_icons, through: :cities

  def update_number_of_inhabitants!
    self.update(number_of_inhabitants: self.get_number_of_inhabitants)
  end

  def get_number_of_inhabitants
    City.where(country_id: self.id).pluck('number_of_inhabitants').sum
  end
end
