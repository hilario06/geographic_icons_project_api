require 'rails_helper'

RSpec.describe Api::V1::CountriesController, type: :controller do
  describe 'Registro de ciudades' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
    let(:continent) { create(:continent) }
    let(:country) {
      {
        denomination: Faker::Address.country,
        number_of_inhabitants: rand(1000..10000),
        totat_surface_area: rand(1000..10000),
        continent_id: continent.id
      }
    }
    context 'Registro del pais correctamente' do
      before do
        request.headers.merge! headers
        post(:create, format: :json, params: { country: country })
      end
      context 'status con estatus created' do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
      context 'estructura correcta de un pais' do
        subject { payload_test }
        it { is_expected.to include(:id, :denomination, :number_of_inhabitants, :totat_surface_area, :continent_id)}
      end
    end
    context 'Fallo registro de pais' do
      before do
        country[:denomination] = ''
        request.headers.merge! headers
        post(:create, format: :json, params: {country: country})
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
    context 'Respuesta de pais sin token' do
      before do
        post(:create, format: :json, params: { country: country })
      end
      context 'Respuesta con status (unauthorized)' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
