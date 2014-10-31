Rails.application.routes.draw do

  root 'administration#index'

  resources :employees
  resources :clients
  resources :behaviors, except: [:show, :new]
  resources :behavior_reports

end