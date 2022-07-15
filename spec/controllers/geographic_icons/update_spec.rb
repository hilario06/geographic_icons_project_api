require 'rails_helper'

RSpec.describe Api::V1::GeographicIconsController, type: :controller do
  describe 'Actualizar iconos geograficos' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}"} }
    let(:city) { create(:city) }
    let(:geographic_icon) { create(:geographic_icon, city: city) }

    context 'Icono Geografico actualizado correctamente' do
      before do
        request.headers.merge! headers
        put(:update, format: :json, params: { id: geographic_icon.id, geographic_icon: { denomination: Faker::Mountain.name } })
      end
      context 'Respuesta con estatus ok' do
        subject{ response }
        it { is_expected.to have_http_status(:ok) }
      end
      context 'Estructura del icono geografico correcto' do
        subject { payload_test }
        it { is_expected.to include(:id, :denomination, :date_of_creation, :height, :history, :created_at, :updated_at, :city_id) }
      end
    end

    context 'El icono geografico no se puede actualizar' do
      before do
        request.headers.merge! headers
        put(:update, format: :json, params: { id: geographic_icon.id, geographic_icon: { denomination: ''} })
      end
      context 'Respuesta con status bad request' do
        subject { response }
        it { is_expected.to have_http_status(:bad_request) }
      end
      context 'Estructura de listado de errores correcta' do
        subject { payload_test }
        it { is_expected.to include(:errors)}
      end
    end

    context 'Actualizar icono geografico sin token' do
      before do
        put(:update, format: :json, params: { id: geographic_icon.id, geographic_icon: { denomination: Faker::Mountain.name }})
      end
      context 'Respuesta con status unauthorized' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
