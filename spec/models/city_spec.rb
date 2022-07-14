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
require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'Validaciones del continente' do
    subject{ build(:city) }

    it 'Validar si denomination esta presente' do
      should validate_presence_of(:denomination)
    end

    it 'Validar si number_of_inhabitants esta presente' do
      should validate_presence_of(:number_of_inhabitants)
    end

    it 'Validar si totat_surface_area esta presente' do
      should validate_presence_of(:totat_surface_area)
    end

    it 'Validar belongs country' do
      should belong_to(:country)
    end

    it 'Validar si existe la relación con iconos geográficos' do
      should have_many(:geographic_icons)
    end
  end
end
