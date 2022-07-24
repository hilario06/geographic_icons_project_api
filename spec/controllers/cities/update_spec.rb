require 'rails_helper'

RSpec.describe Api::V1::CitiesController, type: :controller do
  describe 'Actualizar ciudad' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}"} }
    let(:country) { create(:country) }
    let(:city) { create(:city, country: country) }

    context 'Ciudad actualizado correctamente' do
      before do
        request.headers.merge! headers
        patch(:update, format: :json, params: { id: city.id, city: { denomination: Faker::Mountain.name } })
      end
      context 'Respuesta con status ok' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'Estructura de la ciudad' do
        subject { payload_test }
        it { is_expected.to include(:id, :denomination, :number_of_inhabitants, :totat_surface_area, :country_id)}
      end
    end

    context 'La ciudad no se puede actualizar' do
      before do
        request.headers.merge! headers
        patch(:update, format: :json, params: { id: city.id, city:{ denomination: '' }})
      end
      context 'Respuesta con status bad request' do
        subject { response }
        it { is_expected.to have_http_status(:bad_request) }
      end
      context 'Estructura del listado de errores correcta' do
        subject { payload_test }
        it { is_expected.to include(:errors) }
      end
    end

    context 'Actualizar ciudad sin token' do
      before do
        patch(:update, format: :json, params: { id: city.id, city: { denomination: Faker::Mountain.name }})
      end
      context 'Respuesta con status unauthorized' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
