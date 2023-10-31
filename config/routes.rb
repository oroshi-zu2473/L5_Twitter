Rails.application.routes.draw do
  get 'users/index'
  resources :users
  
  get 'tweets/index'
  resources :tweets
  
  root 'top#main'
  get 'top/login_form'
  post 'top/login'
  get 'top/logout'
  
  resources :likes
end