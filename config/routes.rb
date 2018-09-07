Rails.application.routes.draw do
  root 'sessions#new'
  get '/signup',  to: 'users#new'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users, only: [:create]
  resources :user_locations, except: [:show]
  get '/profile', to: 'users#profile'
  get '/archives', to: 'users#archives'
  get '/search', to: 'users#search'

  post '/favorite', to: 'user_events#mark_favorite'
  post '/ignore', to: 'user_events#mark_ignore'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
