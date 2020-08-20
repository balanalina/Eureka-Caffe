Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'caffes#home'
  get '/home',to: 'caffes#home'
#  get '/about' ,to: '#'
#  get '/service', to: '#'
#  get '/blog', to: '#'
#  get '/contacts', to: '#'
  resources :users do
    get :signup, on: :collection
    put :edit, on: :member
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
  resources :account_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]
  resources :orders do
    get :new, on: :member
    post :create, on: :member
  end
  namespace :admin do
    resources :products do
      put :edit, on: :member
    end
    resources :users do
    get :index, on: :collection
    delete :destroy, on: :member
    end
  end
end
