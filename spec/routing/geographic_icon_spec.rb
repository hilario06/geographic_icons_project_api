require 'rails_helper'

describe 'Rutas de iconos geograficos' do
  it 'Ruta post de iconos geograficos' do
    expect(post: '/api/v1/geographic_icons').to route_to(
      format: 'json',
      controller: 'api/v1/geographic_icons',
      action: 'create'
    )
  end

  it 'Ruta PUT para actualizar iconos geograficos' do
    expect(put: '/api/v1/geographic_icons/1').to route_to(
      format: 'json',
      controller: 'api/v1/geographic_icons',
      action: 'update',
      id: '1'
    )
  end

  it 'Ruta index iconos geograficos' do
    expect(get: '/api/v1/geographic_icons').to route_to(
      format: 'json',
      controller: 'api/v1/geographic_icons',
      action: 'index'
    )
  end

  it 'Ruta delete iconos geograficos' do
    expect(delete: '/api/v1/geographic_icons/1').to route_to(
      format: 'json',
      controller: 'api/v1/geographic_icons',
      action: 'destroy',
      id: '1'
    )
  end

  it 'Ruta restaurar icono geografico' do
    expect(post: '/api/v1/geographic_icons/1/restore').to route_to(
      format: 'json',
      controller: 'api/v1/geographic_icons',
      action: 'restore',
      geographic_icon_id: '1'
    )
  end

  it 'Ruta show de los iconos geograficos' do
    expect(get: '/api/v1/geographic_icons/1').to route_to(
      format: 'json',
      controller: 'api/v1/geographic_icons',
      action: 'show',
      id: '1'
    )
  end
end
