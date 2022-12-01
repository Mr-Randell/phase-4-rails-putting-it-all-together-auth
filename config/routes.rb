Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # sign up
  post "/signup", to: "users#create"
  # auto-login
  get "/me", to: "users#show"
end
