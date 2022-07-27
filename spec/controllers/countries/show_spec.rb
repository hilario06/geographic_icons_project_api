require 'rails_helper'

RSpec.describe Api::V1::CountriesController, type: :controller do
  let(:user) { create(:user) }
  let(:bearer) { create(:token, user: user) }
  let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
  let(:continent) { create(:continent) }
  let(:country) { create(:country, continent: continent) }

  context 'Consultar pais por id' do
    before do
      request.headers.merge! headers # insertamos los headers
      get(:show, format: :json, params: { id: country.id })
    end
    context 'Status 200' do
      subject { response }
      it { is_expected.to have_http_status(:ok) }
    end
    context 'Estructura correcta de la pais' do
      subject { payload_test }
      it { is_expected.to include(:id, :denomination, :number_of_inhabitants, :totat_surface_area, :continent_id) }
    end
  end

  context 'Consultar pais sin token' do
    before do
      get(:show, format: :json, params: { id: country.id })
    end
    context 'Status de response no autorizado' do
      subject { response }
      it { is_expected.to have_http_status(:unauthorized) }
    end
  end
end
