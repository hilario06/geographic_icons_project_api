require 'rails_helper'

RSpec.describe Api::V1::CitiesController, type: :controller do
  describe 'Restaurar un ciudad' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
    let(:country) { create(:country) }
    let(:city) { create(:city, country: country) }

    context 'Restaurar ciudad satisfactoriamente' do
      before do
        city.destroy
        request.headers.merge! headers
        post(:restore, format: :json, params: { city_id: city.id })
      end
      context 'Respuesta con estatus ok' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'Estructura correcta de la ciudad' do
        subject { payload_test }
        it { is_expected.to include(:id, :denomination, :number_of_inhabitants, :totat_surface_area, :country_id) }
      end
    end
    context 'Fallo restauracion de la ciudad' do
      before do
        city.destroy
        post(:restore, format: :json, params: { city_id: city.id })
      end
      context 'Respuesta con status unauthorized' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
