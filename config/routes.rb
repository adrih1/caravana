Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :vans, only: [:index, :show, :new, :create, :edit, :destroy] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:destroy, :show, :index] do
    resources :reviews
  end

  get "dashboard", to: "pages#dashboard"
  get "my_vans", to: "pages#my_vans"
end
