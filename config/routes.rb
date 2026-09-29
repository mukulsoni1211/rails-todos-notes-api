Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post :login, to: "session#login"
  post :signup, to: "registration#signup"
  resources :todos, only: [:index, :create, :update, :destroy]
  resources :notes, only: [:index, :show, :create, :update, :destroy]
end
