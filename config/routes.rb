Rails.application.routes.draw do

  root 'client_sessions#new'

  resource :client_sessions, only: [:new, :create, :destroy]

  resources :employees
  resources :clients
  resources :behaviors, except: [:show, :new]
  resources :behavior_reports

end