Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: 'top#index', as: :authenticated_root
  end
  root 'home#index'
  resources :allergies, only: [:index]
end
