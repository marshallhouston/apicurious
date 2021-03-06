Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  resources :users, only: [:show] do
    resources :repositories, only: [:index]
    resources :starred, only: [:index]
    resources :followers, only: [:index]
    resources :followed, only: [:index]
  end
end
