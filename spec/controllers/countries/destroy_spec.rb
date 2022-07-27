require 'rails_helper'

RSpec.describe Api::V1::CountriesController, type: :controller do
  describe 'Eliminar ciudad' do
    let(:user) { create(:user) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}"} }
    let(:continent) { create(:continent) }
    let(:country) { create(:country, continent: continent) }

    context 'Eliminar pais satisfactoriamente' do
      before do
        request.headers.merge! headers
        delete(:destroy, format: :json, params: { id: country.id })
      end
      context 'Respuesta con status ok' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
    end

    context 'Eliminar pais sin token' do
      before do
        delete(:destroy, format: :json, params: { id: country.id })
      end
      context 'Respuesta con status unauthorized' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
