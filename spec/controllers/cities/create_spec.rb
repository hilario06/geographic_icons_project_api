require 'rails_helper'

RSpec.describe Api::V1::CitiesController, type: :controller do
  describe 'Registro de ciudades' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
    let(:country) { create(:country) }
    let(:city) {
      {
        denomination: Faker::Mountain.name,
        number_of_inhabitants: rand(1000..10000),
        totat_surface_area: rand(1000..10000),
        country_id: country.id
      }
    }
    context 'Registro de la ciudad correctamente' do
      before do
        request.headers.merge! headers
        post(:create, format: :json, params: { city: city })
      end
      context 'status con estatus created' do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
      context 'estructura correcta de una ciudad' do
        subject { payload_test }
        it { is_expected.to include(:id, :denomination, :number_of_inhabitants, :totat_surface_area, :country_id)}
      end
    end
    context 'Fallo registro de ciudad' do
      before do
        city[:denomination] = ''
        request.headers.merge! headers
        post(:create, format: :json, params: {city: city})
      end
      context 'Respuesta con status de bad request' do
        subject { response }
        it { is_expected.to have_http_status(:bad_request) }
      end
      context 'Estructura de la lista de errores correcto' do
        subject { payload_test }
        it { is_expected.to include(:errors) }
      end
    end
    context 'Respuesta de ciudad sin token' do
      before do
        post(:create, format: :json, params: { city: city })
      end
      context 'Respuesta con status (unauthorized)' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
