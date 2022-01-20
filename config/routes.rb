Rails.application.routes.draw do
  root 'users#index'
  
  devise_for :users, controllers: { sessions: 'users/sessions', registration: 'users/registrations' }
  
  resources :users, only: [:index]
end
