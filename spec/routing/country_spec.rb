require 'rails_helper'

describe 'Rutas de paises' do
  it 'Ruta index paises' do
    expect(get: '/api/v1/countries').to route_to(
      format: 'json',
      controller: 'api/v1/countries',
      action: 'index'
    )
  end
end
