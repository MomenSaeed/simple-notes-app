Rails.application.routes.draw do
  # resources :notes
  devise_for :users
  # resources :users
  root to: 'notes#index'

  resources :users do
    resources :notes
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
