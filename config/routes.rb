Rails.application.routes.draw do
  get 'events/new'
  get 'sessions/new'
  resources :events, only: %i[new index show create]
  resources :users, only: %i[new create show]
  resources :attendances
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  root to: 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
