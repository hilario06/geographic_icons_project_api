# == Schema Information
#
# Table name: continents
#
#  id           :bigint           not null, primary key
#  denomination :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Continent, type: :model do
  describe 'Validaciones del continente' do
    subject{ build(:continent) }

    it 'Validar si denomination esta presente' do
      should validate_presence_of(:denomination)
    end

    it 'Validar si existe la relación con pais' do
      should have_many(:countries)
    end

    it 'Validar si existe la relación con ciudad' do
      should have_many(:cities)
    end

    it 'Validar si existe la relación con iconos geográficos' do
      should have_many(:geographic_icons)
    end
  end
end
