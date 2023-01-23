Rails.application.routes.draw do
  root "books#index"

  resources :books, except: [:show]

  get 'charts', to: 'charts#index'
end
