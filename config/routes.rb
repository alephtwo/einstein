Rails.application.routes.draw do

  root 'filter#index'

  devise_for :users, :path => '', :path_names => {:sign_in => 'staff'}, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  get '/users/disperse/:id', to: 'users#disperse', as: 'disperse'
  post '/users/disperse/:id', to: 'users#migrate', as: 'migrate'
  resources :users

  get '/login', to: 'client_sessions#new'
  delete '/logout',  to: 'client_sessions#destroy'
  resources :client_sessions, only: [:new, :create, :destroy]

  get '/remove_client/:id', to: 'clients#remove'
  resources :clients

  get '/remove_behavior/:id', to: 'behaviors#remove'
  resources :behaviors, except: [:new]

  get '/submit', to: 'behavior_reports#new'
  get '/remove_report/:id', to: 'behavior_reports#remove'
  resources :behavior_reports

  get '/maintenances', to: 'maintenances#index'
  delete '/clean_db', to: 'maintenances#clean'
  get '/maintenances/disclaimer', to: 'maintenances#disclaimer'
end
