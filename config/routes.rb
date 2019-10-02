Rails.application.routes.draw do
  resources :comments, only: [:create]
  resources :groups
  resources :transactions, only: [:create]
  resources :cereals
  resources :users, only: [:show, :new, :create, :edit, :update]
  get '/', to: 'users#home', as: 'home'
  resources :sessions, only: [:new, :create]
  # get '/sessions', to
  delete '/sessions', to: 'sessions#destroy', as: 'session'
  post '/group/:id', to: 'groups#join', as: 'join'
  get 'cereals/list/:name', to: 'cereals#list', as: 'list'
 

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
