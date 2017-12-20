Rails.application.routes.draw do
  resources :alerts, only: [:index, :create] do
    collection do
      delete :revoke
    end
  end
  mount Swaggard::Engine, at: '/api_docs/swagger/'
end
