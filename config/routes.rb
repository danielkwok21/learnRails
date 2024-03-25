Rails.application.routes.draw do
  get "/about", to: "about#index"
  get "/signup", to: "user#index"
  post "/signup", to: "user#create"
  get "/login", to: "session#index"
  delete "/logout", to: "session#delete"
  post "/login", to: "session#create"
  root to: "main#index"
end
