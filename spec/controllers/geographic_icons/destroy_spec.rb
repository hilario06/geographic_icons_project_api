require 'rails_helper'

RSpec.describe Api::V1::GeographicIconsController, type: :controller do
  describe 'Eliminar un icono geografico' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
    let(:city) { create(:city) }
    let(:geographic_icon) { create(:geographic_icon, city: city) }

    context 'Eliminar icono geografico satisfactoriamente' do
      before do
        request.headers.merge! headers
        delete(:destroy, format: :json, params: { id: geographic_icon.id })
      end
      context 'Respuesta con estatus ok' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
    end

    context 'Eliminar icono geografico sin token' do
      before do
        delete(:destroy, format: :json, params: { id: geographic_icon.id } )
      end
      context 'Respuesta con status unauthorized' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
