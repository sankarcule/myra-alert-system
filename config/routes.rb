Rails.application.routes.draw do
  resources :alerts, only: [:index, :create, :destroy]

  mount Swaggard::Engine, at: '/api_docs/swagger/'
end
