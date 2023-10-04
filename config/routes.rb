Rails.application.routes.draw do
  root "home#index"

  get "/facts", to: "facts#index"
end
