Rails.application.routes.draw do

  root 'home#index'
  get  '/help',    to: 'home#help'
  get  '/about',   to: 'home#about'
  get  '/contact', to: 'home#contact'
  get '/users', to: 'users#index'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
