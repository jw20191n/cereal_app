Rails.application.routes.draw do
  resources :groups
  resources :transactions, only: [:index]
  resources :cereals
  resources :users, only: [:show, :new, :create, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
