Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/new'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'caffes#home'
  get '/home' ,to: 'caffes#home'
#  get '/about' ,to: '#'
#  get '/service', to: '#'
#  get '/blog', to: '#'
#  get '/contacts', to: '#'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :sessions
end
