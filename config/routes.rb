Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :vans, only: [:index, :show, :new, :create, :edit, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy, :show, :index]

  get "dashboard", to: "pages#dashboard"
end
