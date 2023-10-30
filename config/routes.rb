Rails.application.routes.draw do
  #root 'users#index'
  #resources :users
  
  root 'tweets#index'
  resources :tweets
end
