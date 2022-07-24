require 'rails_helper'

RSpec.describe Api::V1::CitiesController, type: :controller do
  let(:user) { create(:user) }
  let(:bearer) { create(:token, user: user) }
  let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
  let(:country) { create(:country) }
  let(:city) { create(:city, country: country) }

  context 'Consultar ciudad por id' do
    before do
      request.headers.merge! headers # insertamos los headers
      get(:show, format: :json, params: { id: city.id })
    end
    context 'Status 200' do
      subject { response }
      it { is_expected.to have_http_status(:ok) }
    end
    context 'Estructura correcta de la ciudad' do
      subject { payload_test }
      it { is_expected.to include(:id, :denomination, :number_of_inhabitants, :totat_surface_area, :country_id) }
    end
  end

  context 'Consultar ciudad sin token' do
    before do
      get(:show, format: :json, params: { id: city.id })
    end
    context 'Status de response no autorizado' do
      subject { response }
      it { is_expected.to have_http_status(:unauthorized) }
    end
  end
end
