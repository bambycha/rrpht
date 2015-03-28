Rails.application.routes.draw do
  resources :photos
  resources :users

  get   'login',       to: 'user_sessions#new',      as: :login
  post  'login',       to: 'user_sessions#create'
  get   'logout',      to: 'user_sessions#destroy',  as: :logout
  
  get   'pages/:page', to: 'pages#page'

  root 'users#index'
end
