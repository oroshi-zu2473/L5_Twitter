Rails.application.routes.draw do
  #root 'users#index'
  #resources :users
  
  get 'tweets/index'
  resources :tweets
  
  root 'top#login_form'
  post 'top/login'
  get 'top/logout'
end
