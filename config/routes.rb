Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #to Show healthy server
  get "/", to: proc { [200, {}, ["Rails API is running"]] }

  post :login, to: "session#login"
  post :signup, to: "registration#signup"
  resources :todos, only: [:index, :create, :update, :destroy]
  resources :notes, only: [:index, :show, :create, :update, :destroy]
end
