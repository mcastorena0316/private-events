Rails.application.routes.draw do
  get 'sessions/new'
  root 'events#index'
  get '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users, :only => [:new, :create, :show]
  resources :sessions
  resources :events, :only => [:create, :show, :index] 
  resources :event_attendances, :only => [:create, :show] 
end
