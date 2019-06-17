Rails.application.routes.draw do
  get "words/index"
  root "static_pages#home"

  get "/about", to: "static_pages#about"
  get "/signup", to: "users#new"
  get "sessions/new"
  get "/about", to: "static_pages#about"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: %i(new create show)
  resources :categories, only: :index
  resources :lessons do
    resources :results
  end
  resources :words
  resources :users do
    member do
      get :following, :followers
    end
  end

 resources :relationships, only: %i(create destroy)
end
