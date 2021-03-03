Rails.application.routes.draw do

  namespace :admin do
    resources :resource
  end

  resources :resource

  resources :registrations, only: [:create]
  resources :sessions, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"

  root to: "static#home"
end
