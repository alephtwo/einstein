Rails.application.routes.draw do

  get 'maintenances/index'

  #root 'behavior_reports#new'
  root 'filter#index'  

  devise_for :users, :path => '', :path_names => {:sign_in => 'staff'}, :skip => [:registrations] 
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  
  match '/users/disperse/:id', to: 'users#disperse', via: 'get', as: 'disperse'
  match '/users/disperse/:id', to: 'users#migrate', via: 'post', as: 'migrate'

  resources :users

  match '/login', to: 'client_sessions#new', via: 'get' 
  match '/logout',  to: 'client_sessions#destroy', via: 'delete'
  resources :client_sessions, only: [:new, :create, :destroy]

  resources :employees
  match '/remove_client/:id', to: 'clients#remove', via: 'get'
  resources :clients
  match '/remove_behavior/:id', to: 'behaviors#remove', via: 'get'
  resources :behaviors, only: [:create, :edit, :update, :destroy, :index, :remove]

  match '/submit', to: 'behavior_reports#new', via: 'get'
  match '/remove_report/:id', to: 'behavior_reports#remove', via: 'get'
  resources :behavior_reports

  match '/clean_db', to: 'maintenances#clean', via: 'delete'
  match '/maintenances/disclaimer', to: 'maintenances#disclaimer', via: 'get'
  resources :maintenances, only: [:index]

  match '/filter', to: 'filter#index', via: 'get'

end
