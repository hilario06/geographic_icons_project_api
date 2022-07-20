require 'rails_helper'

describe 'Rutas de ciudad' do
  it 'Ruta index ciudades' do
    expect(get: '/api/v1/cities').to route_to(
      format: 'json',
      controller: 'api/v1/cities',
      action: 'index'
    )
  end
end
