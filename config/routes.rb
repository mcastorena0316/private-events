Rails.application.routes.draw do
  root 'users#new'
  get '/signup',  to: 'users#new'
  resources :users, :only => [:new, :create, :show]
end
