Rails.application.routes.draw do
  scope '(:locale)', locale: /es|en/ do
    get 'home/grettings'

    namespace :api do
      namespace :v1, defaults: { format: 'json' } do
        resources :users, only: %i[create] do
          # api/v1/users/login
          post 'login', on: :collection
        end
        resources :geographic_icons, only: %i[create update index destroy show] do
          # api/v1/geographic_icons/:geographic_icon_id/restore
          post 'restore'
        end
        resources :cities, only: %i[index create update]
      end
    end

  end
end
