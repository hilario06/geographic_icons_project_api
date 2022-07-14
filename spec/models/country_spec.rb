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
require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'Validaciones del continente' do
    subject{ build(:country) }

    it 'Validar si denomination esta presente' do
      should validate_presence_of(:denomination)
    end

    it 'Validar si totat_surface_area esta presente' do
      should validate_presence_of(:totat_surface_area)
    end

    it 'Validar belongs continente' do
      should belong_to(:continent)
    end

    it 'Validar si existe la relación con ciudad' do
      should have_many(:cities)
    end

    it 'Validar si existe la relación con iconos geográficos' do
      should have_many(:geographic_icons)
    end
  end
end
