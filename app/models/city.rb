# == Schema Information
#
# Table name: cities
#
#  id                    :bigint           not null, primary key
#  denomination          :string
#  number_of_inhabitants :integer          default(0)
#  totat_surface_area    :float
#  country_id            :bigint           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class City < ApplicationRecord
  acts_as_paranoid # para el borrado logico

  belongs_to :country
  has_many :geographic_icons, dependent: :destroy

  validates :denomination, :number_of_inhabitants, :totat_surface_area, presence: true

  include PgSearch::Model
  pg_search_scope :city_search,
    against: [ :denomination ],
    using: {
      tsearch: { prefix: true }
    }
end
