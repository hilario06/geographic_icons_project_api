require 'rails_helper'

describe 'Rutas de resources user' do
  it 'Registro de usuarios' do
    expect(post: 'api/v1/users').to route_to(
      format: 'json',
      controller: 'api/v1/users',
      action: 'create'
    )
  end
end
