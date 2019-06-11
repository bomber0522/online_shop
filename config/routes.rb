Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as: "about"
  get "contact" => "top#contact"
  get "/signup", to: "members#new"
  post "/signup", to: "members#create"
  resources :members
end
