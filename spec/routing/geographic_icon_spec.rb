require 'rails_helper'

describe 'Rutas de iconos geograficos' do
  it 'Ruta post de iconos geograficos' do
    expect(post: 'api/v1/geographic_icons').to route_to(
      format: 'json',
      controller: 'api/v1/geographic_icons',
      action: 'create'
    )
  end
end
