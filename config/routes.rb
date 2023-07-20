Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'pages/home'
  get 'pages/about'
  resources :products
  root "pages#home"
  get 'products/category_select'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/products/by_category', to: 'products#by_category', as: 'products_by_category'
  # Defines the root path route ("/")
  # root "articles#index"
end
