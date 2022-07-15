require 'rails_helper'

RSpec.describe Api::V1::GeographicIconsController, type: :controller do
  describe 'Restaurar un icono geografico' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
    let(:city) { create(:city) }
    let(:geographic_icon) { create(:geographic_icon, city: city) }
    context 'Restaurar icono geografico satisfactoriamente' do
      before do
        geographic_icon.destroy
        request.headers.merge! headers
        post(:restore, format: :json, params: { geographic_icon_id: geographic_icon.id })
      end
      context 'Respuesta con estatus ok' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'Estructura correcta del icono geografico' do
        subject { payload_test }
        it { is_expected.to include(:id, :denomination, :date_of_creation, :height, :history, :city_id) }
      end
    end
    context 'Fallo restauracion del icono geografico' do
      before do
        geographic_icon.destroy
        post(:restore, format: :json, params: { geographic_icon_id: geographic_icon.id })
      end
      context 'Respuesta con status unauthorized' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
