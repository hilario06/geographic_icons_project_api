require 'rails_helper'

RSpec.describe Api::V1::GeographicIconsController, type: :controller do
  let(:user) { create(:user) }
  let(:bearer) { create(:token, user: user) }
  let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
  let(:city) { create(:city) }
  let(:geographic_icon) { create(:geographic_icon, city: city) }

  context 'Consultar icono geografico por id' do
    before do
      request.headers.merge! headers # insertamos los headers
      get(:show, format: :json, params: { id: geographic_icon.id })
    end
    context 'Status 200' do
      subject { response }
      it { is_expected.to have_http_status(:ok) }
    end
    context 'Estructura correcta del icono geografico' do
      subject { payload_test }
      it { is_expected.to include(:id, :denomination, :date_of_creation, :height, :history, :city_id) }
    end
  end

  context 'Consultar icono geografico sin token' do
    before do
      get(:show, format: :json, params: { id: geographic_icon.id })
    end
    context 'Status de response no autorizado' do
      subject { response }
      it { is_expected.to have_http_status(:unauthorized) }
    end
  end
end
