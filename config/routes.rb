Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  
  devise_scope :user do
    authenticated :user do
      root 'users#show', as: :authenticated_root
    end

    unauthenticated :user do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end

  resources :posts, only: [:create, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :like_counter, only: [:update]
  end

  
  resources :users, only: [:index, :show] do
    resource :profile, only: [:show]
    resource :detail, only: [:new, :create, :edit, :update]
  end
end
