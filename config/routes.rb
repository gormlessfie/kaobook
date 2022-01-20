Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registration: 'users/registrations' }

  devise_scope :user do
    authenticated :user do
      root 'users#show', as: :authenticated_root
    end

    unauthenticated :user do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end
  
  resources :users, only: [:index]
end
