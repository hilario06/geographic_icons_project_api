Rails.application.routes.draw do
  scope '(:locale)', locale: /es|en/ do
    get 'home/grettings'

    namespace :api do
      namespace :v1, defaults: { format: 'json' } do
        resources :users, only: %i[create]
      end
    end

  end
end
