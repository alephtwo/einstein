Rails.application.routes.draw do

  root 'behavior_reports#new'

  resource :client_sessions, only: [:new, :create, :destroy]

  resources :employees
  resources :clients
  resources :behaviors, except: [:show, :new]
  resources :behavior_reports

end