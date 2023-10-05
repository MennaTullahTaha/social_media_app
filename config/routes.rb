Rails.application.routes.draw do
  root "home#index"

  get "/home", to: "home#index"
  get "/register", to: "register#index"
  get "/login", to: "login#index"

  get "/facts", to: "facts#index"

end
