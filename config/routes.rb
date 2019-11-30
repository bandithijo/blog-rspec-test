Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'frontpage#index'
  resources :authors, only: %w[index show new create edit update destroy]
  resources :articles, only: %w[index show new create edit update destroy]
end
