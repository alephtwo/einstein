Rails.application.routes.draw do

  root 'behavior_reports#new'

  devise_for :users, :path => '', :path_names => {:sign_in => 'staff'}, :skip => [:registrations] 
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  
  resources :users
  match '/toggle_admin/:id', to: 'users#toggle_admin', via: 'get'


  match '/login', to: 'client_sessions#new', via: 'get' 
  match '/logout',  to: 'client_sessions#destroy', via: 'delete'
  resources :client_sessions, only: [:new, :create, :destroy]

  resources :employees
  resources :clients
  resources :behaviors, only: [:create, :edit, :update, :destroy, :index]

  match '/submit', to: 'behavior_reports#new', via: 'get'
  resources :behavior_reports, only: [:new, :create, :destroy, :index]

end