Rails.application.routes.draw do
  get '/' => 'sessions#home' 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new' 
  post '/signup' => 'users#create' 
  delete '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#omniauth'
 
  resources :categories
  resources :reviews
  resources :users, only: [:show]
  resources :games do
    resources :reviews, only: [:new, :index]
  end
end