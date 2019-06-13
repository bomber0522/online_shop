Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as: "about"
  get "contact" => "top#contact"
  get "/signup", to: "members#new"
  post "/signup", to: "members#create"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :members do
    resources :entries, only: [:index]
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :articles
  resources :entries
end
