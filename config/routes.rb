Rails.application.routes.draw do

  # baseurl/admin/resource
  namespace :admin do
    resources :resource
  end

  # baseurl/resource
  resources :resource

  # baseurl/registrations
  resources :registrations, only: [:create]

  # baseurl/sessions
  resources :sessions, only: [:create]

  # baseurl/logout
  delete :logout, to: "sessions#logout"

  # baseurl/logged_in
  get :logged_in, to: "sessions#logged_in"

  # baseurl
  # used to make sure the API is up and running
  root to: "static#home"
end
