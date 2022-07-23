require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'Inicio de sesion del usuario' do
    let(:user) { create(:user, password: '123456') }
    context 'Inicio de sesión correcto' do
      before do
        post(:login, format: :json, params: {
          user: {
            email: user.email,
            password: 123456
          }
        })
      end
      context 'Estatus correcto (Ok)' do
        subject { response }
        it { is_expected.to have_http_status(:ok)}
      end
      context 'Respuesta de login correcta' do
        subject { payload_test }
        it { is_expected.to include(:id, :email, :token) }
      end
      context 'Estructura de respuesta de token correcta' do
        subject { payload_test[:token] }
        it { is_expected.to include(:id, :token, :expires_at)}
      end
    end
    context 'Inicio de sesión fallido' do
      before do
        post(:login, format: :json, params: {
          user: {
            email: user.email,
            password: ''
          }
        })
      end
      context 'Estatus de correcto (bad_request)' do
        subject { response }
        it { is_expected.to have_http_status(:bad_request) }
      end
      context 'Estructura de login correcta' do
        subject { payload_test }
        it { is_expected.to include(:errors) }
      end
    end
  end
end
