Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: 'top#index', as: :authenticated_root
  end
  root 'home#index'
  resources :allergies
  resources :vaccines 
  resources :medications
  resources :underlying_conditions
  resources :body_types
  get 'body_types/more', to: 'body_types#more', as: 'more_body_types'
end
