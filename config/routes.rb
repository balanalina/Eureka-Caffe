Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'caffes#home'
  get '/home',to: 'caffes#home'
#  get '/about' ,to: '#'
#  get '/service', to: '#'
#  get '/blog', to: '#'
#  get '/contacts', to: '#'
  resources :users do
    get :signup, on: :collection
  end
  resources :sessions do
    get :login
    post :login, on: :collection
    delete :logout, on: :member
  end
  resources :carts do
    get :show, on: :member
  end
  resources :cart_items
  resources :products

end
