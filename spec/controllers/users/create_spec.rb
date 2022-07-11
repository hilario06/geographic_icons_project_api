require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'Registro de usuarios' do
    let(:user) { {  email: Faker::Internet.email,
                    age: rand(30...100),
                    password: Faker::Internet.password(min_length: 10, max_length: 20)
                  }
                }
    context 'Usuario registrado correctamente' do
      before do # se ejecuta antes de iniciar las pruebas
        post(:create, format: :json, params: { user: user })
      end
      context 'Respuesta con status created' do
        subject { response } # el objeto a evaluar
        it { is_expected.to have_http_status(:created) }
      end
      context 'Respuesta con valores correctos de user' do
        subject { payload_test } # desde helpers/application_helper/method convirtiendo a json
        it { is_expected.to include(:id, :email, :age) }
      end
    end

  end
end
