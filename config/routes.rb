Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'commitments/index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout

  resources :hackdays do
    resources :projects
    resources :pitches, only: [:index, :create, :destroy]
  end

  resources :projects do
    resources :goals
  end

  resources :goals do
    resource :commitment, only: [:create, :destroy]
    resource :like, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show]

  root to: 'hackdays#index'
end
