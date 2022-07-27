require 'rails_helper'

describe 'Rutas de paises' do
  it 'Ruta index paises' do
    expect(get: '/api/v1/countries').to route_to(
      format: 'json',
      controller: 'api/v1/countries',
      action: 'index'
    )
  end

  it 'Ruta post de paises' do
    expect(post: '/api/v1/countries').to route_to(
      format: 'json',
      controller: 'api/v1/countries',
      action: 'create'
    )
  end

  it 'Ruta PUT para actualizar paises' do
    expect(patch: '/api/v1/countries/1').to route_to(
      format: 'json',
      controller: 'api/v1/countries',
      action: 'update',
      id: '1'
    )
  end
end
