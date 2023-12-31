Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'pages/home'
  get 'pages/about'
  resources :categories
  resources :products do
    patch :update_sale_status, on: :member
    collection do
      get 'search'
    end
  end
  root "pages#home"
  resources :categories

get 'cart', to: 'cart#show'
post 'cart/add'
post 'cart/remove'
get 'cart/checkout', to: 'cart#checkout', as: :cart_checkout




end
