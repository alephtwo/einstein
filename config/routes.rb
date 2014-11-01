Rails.application.routes.draw do

  root 'behavior_reports#new'

  match '/logout',  to: 'client_sessions#destroy', via: 'delete'
  resources :client_sessions, only: [:new, :create]
  resources :employees
  resources :clients
  resources :behaviors, except: [:show, :new]
  resources :behavior_reports

end