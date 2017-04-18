Rails.application.routes.draw do
  root 'products#index'

  resources :products, only: :index do
    get 'filter', on: :collection
  end

end
