Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # sign up
  post "/signup", to: "users#create"
  # auto-login
  get "/me", to: "users#show"
  
  # Log in
  post "/login", to: "sesions#create"
  # Log out
  delete "/logout", to: "sesions#destroy"

  # Display all recipes
  get "/recipes", to: "recipes#index"

  # Create new recipe
  post "/recipes", to: "recipes#create" 
end
