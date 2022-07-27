require 'rails_helper'

RSpec.describe Api::V1::CountriesController, type: :controller do
  describe 'Restaurar un pais' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
    let(:continent) { create(:continent) }
    let(:country) { create(:country, continent: continent) }

    context 'Restaurar pais satisfactoriamente' do
      before do
        country.destroy
        request.headers.merge! headers
        post(:restore, format: :json, params: { country_id: country.id })
      end
      context 'Respuesta con estatus ok' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'Estructura correcta de la pais' do
        subject { payload_test }
        it { is_expected.to include(:id, :denomination, :number_of_inhabitants, :totat_surface_area, :continent_id) }
      end
    end
    context 'Fallo restauracion de la pais' do
      before do
        country.destroy
        post(:restore, format: :json, params: { country_id: country.id })
      end
      context 'Respuesta con status unauthorized' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
