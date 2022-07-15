require 'rails_helper'

RSpec.describe Api::V1::GeographicIconsController, type: :controller do
  describe 'Registro de iconos geograficos' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
    let(:city) { create(:city) }
    let(:geographic_icon) {
      {
        denomination: Faker::Mountain.name,
        date_of_creation: "1960-07-11",
        height: rand(10..100),
        history: Faker::Lorem.sentence(word_count: 50),
        city_id: city.id
      }
    }
    context 'Registro del icono geografico correctamente' do
      before do
        request.headers.merge! headers
        post(:create, format: :json, params: { geographic_icon: geographic_icon })
      end
      context 'Respuesta con status de created' do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
      context 'Estructura correcta del icono geografico' do
        subject { payload_test }
        it { is_expected.to include(:id, :denomination, :date_of_creation, :height, :history, :created_at, :updated_at, :city_id) }
      end
    end
    context 'Fallo registro del icono geografico' do
      before do
        geographic_icon[:denomination] = ''
        request.headers.merge! headers
        post(:create, format: :json, params: { geographic_icon: geographic_icon })
      end
      context 'Respuesta con status de bad request' do
        subject { response }
        it { is_expected.to have_http_status(:bad_request)}
      end
      context 'Estructura del lista de errores correcto' do
        subject { payload_test }
        it { is_expected.to include(:errors) }
      end
    end
    context 'Registro de icono geografico sin token' do
      before do
        post(:create, format: :json, params: { geographic_icon: :geographic_icon })
      end
      context 'Respuesta con status (unauthorized)' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized)}
      end
    end
  end
end
