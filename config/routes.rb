Rails.application.routes.draw do
  get "/about", to: "about#index"
  get "/signup", to: "user#index"
  post "/signup", to: "user#create"
  root to: "main#index"
end
