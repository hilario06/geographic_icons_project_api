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
class GeographicIcon < ApplicationRecord
  belongs_to :city

  validates :denomination, :date_of_creation, :height, :history, presence: true
  validates :height, numericality: true

end
