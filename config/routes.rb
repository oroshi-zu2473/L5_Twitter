Rails.application.routes.draw do
  get 'tweets/index'
  resources :users
  root 'users#index'
end
