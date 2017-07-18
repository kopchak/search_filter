Rails.application.routes.draw do
  root 'home#index'

  namespace :api, defaults: { format: :json } do
    resources :products, only: :index do
      get 'filter', on: :collection
    end
  end
end
