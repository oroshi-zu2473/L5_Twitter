Rails.application.routes.draw do
  resources :users
  root 'users#index'
  get 'users/index'
  get 'users/new'
  post 'users/create'
end
