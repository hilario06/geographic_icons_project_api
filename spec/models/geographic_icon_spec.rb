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
require 'rails_helper'

RSpec.describe GeographicIcon, type: :model do
  describe 'Validaciones del Icono geográfico' do
    subject{ build(:geographic_icon) }

    it 'Validar si denomination esta presente' do
      should validate_presence_of(:denomination)
    end

    it 'Validar si date_of_creation esta presente' do
      should validate_presence_of(:date_of_creation)
    end

    it 'Validar si height esta presente' do
      should validate_presence_of(:height)
    end

    it 'Validar si history esta presente' do
      should validate_presence_of(:history)
    end

    it 'validar si height es un numero entero' do
      should validate_numericality_of(:height)
    end

    it 'Validar belongs continente' do
      should belong_to(:city)
    end
  end
end
