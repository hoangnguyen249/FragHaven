Rails.application.routes.draw do
  devise_for :users
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
  get 'admin/index'
  resources :categories
get 'users/public_index', to: 'users#public_index'
get 'cart', to: 'cart#show'
post 'cart/add'
post 'cart/remove'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # root "articles#index"
end
