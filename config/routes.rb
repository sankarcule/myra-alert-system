Rails.application.routes.draw do
  resources :alerts, only: [:index, :create, :destroy]
end
