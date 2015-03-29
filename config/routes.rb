Rails.application.routes.draw do
  resources :photos do
    collection do
      get 'search'
    end
  end
  resources :users

  get   'tags/:tag',   to: 'photos#index',           as: :tag

  get   'login',       to: 'user_sessions#new',      as: :login
  post  'login',       to: 'user_sessions#create'
  get   'logout',      to: 'user_sessions#destroy',  as: :logout
  
  get   'pages/:page', to: 'pages#page'

  root 'users#index'
end
