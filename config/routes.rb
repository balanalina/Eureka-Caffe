Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'caffes#home'
  get '/home' ,to: 'caffes#home'
#  get '/about' ,to: '#'
#  get '/service', to: '#'
#  get '/blog', to: '#'
#  get '/contacts', to: '#'
  # get '/signup', to: '#'
  # get '/login', to: '#'
end
