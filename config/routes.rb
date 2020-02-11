Rails.application.routes.draw do
  resources :sessions, only: [:index, :create]
  get "/login", to: "sessions#new", as: "login"
  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :reviewers, only: [:index, :create]
  get "/signup", to: "reviewers#new", as: "signup"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "books#index"
  resources :books do
    resources :notes, only: [:index, :create, :destroy, :edit, :update]
  end
end
