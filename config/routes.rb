Rails.application.routes.draw do

  root 'behavior_reports#new'

  devise_for :users, :path => '', :path_names => {:sign_in => 'staff'}
  resources :users

  match '/login', to: 'client_sessions#new', via: 'get' 
  match '/logout',  to: 'client_sessions#destroy', via: 'delete'
  resources :client_sessions, only: [:new, :create, :destroy]

  resources :employees
  resources :clients
  resources :behaviors, only: [:create, :edit, :update, :destroy]

  match '/submit', to: 'behavior_reports#new', via: 'get'
  resources :behavior_reports, only: [:new, :create, :destroy]

end