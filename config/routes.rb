Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks' }
  
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated :user do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end

  resources :posts, only: [:index, :create, :destroy] do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :friendships, only: [:create, :destroy, :update]
  
  resources :users, only: [:index, :show] do
    resource :profile, only: [:show, :update]
    resource :detail, only: [:new, :create, :edit, :update]
  end
end
