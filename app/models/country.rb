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
class Country < ApplicationRecord
  belongs_to :continent
  has_many :cities, dependent: :destroy
  has_many :geographic_icons, through: :cities

  validates :denomination, :totat_surface_area, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :denomination ],
    using: {
      tsearch: { prefix: true }
    }

  def update_number_of_inhabitants!
    self.update(number_of_inhabitants: self.get_number_of_inhabitants)
  end

  def get_number_of_inhabitants
    City.where(country_id: self.id).pluck('number_of_inhabitants').sum
  end
end
