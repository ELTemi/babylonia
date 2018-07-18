Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'caregivers#home'

  resources :dailylogs
  resources :caregivers
  resources :moms do
    resources :babies
  end

  resources :babies

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#logout'


end
