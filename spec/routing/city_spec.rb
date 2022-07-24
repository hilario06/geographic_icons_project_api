require 'rails_helper'

describe 'Rutas de ciudad' do
  it 'Ruta index ciudades' do
    expect(get: '/api/v1/cities').to route_to(
      format: 'json',
      controller: 'api/v1/cities',
      action: 'index'
    )
  end

  it 'Ruta post de ciudades' do
    expect(post: '/api/v1/cities').to route_to(
      format: 'json',
      controller: 'api/v1/cities',
      action: 'create'
    )
  end

  it 'Ruta PUT para actualizar ciudades' do
    expect(patch: '/api/v1/cities/1').to route_to(
      format: 'json',
      controller: 'api/v1/cities',
      action: 'update',
      id: '1'
    )
  end

  it 'Ruta delete ciudades' do
    expect(delete: '/api/v1/cities/1').to route_to(
      format: 'json',
      controller: 'api/v1/cities',
      action: 'destroy',
      id: '1'
    )
  end

  it 'Ruta show de las ciudades' do
    expect(get: '/api/v1/cities/1').to route_to(
      format: 'json',
      controller: 'api/v1/cities',
      action: 'show',
      id: '1'
    )
  end
end
