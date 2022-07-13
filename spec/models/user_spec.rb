require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Valiaciones del modelo user' do
    subject { build(:user) }
    it 'validar si el email esta presente' do
      should validate_presence_of(:email)
    end
    it 'validar si el password esta presente' do
      should validate_presence_of(:password_digest)
    end
    it 'validar si el age esta presente' do
      should validate_presence_of(:age)
    end
    it 'validar si el correo es unico' do
      should validate_uniqueness_of(:email)
    end
    it 'validar que no acepte correos incorrectos' do
      should_not allow_value('test').for(:email)
    end
    it 'validar si age es un numero entero' do
      should validate_numericality_of(:age).only_integer
    end
    it 'Validar relacion con tokens' do
      should have_many(:tokens)
    end
  end
end
