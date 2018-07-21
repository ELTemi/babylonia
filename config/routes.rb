Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#home'

  resources :dailylogs
  resources :caregivers
  resources :babies
  resources :moms

  resources :babies do
    resources :dailylogs
  end

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#logout'
  get '/auth/facebook/callback' => 'sessions#facebook_create'
  get '/auth/facebook/callback' => 'caregivers#facebook_create'

end
