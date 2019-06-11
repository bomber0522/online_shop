Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as: "about"
  get "contact" => "top#contact"
  resources :members
end
