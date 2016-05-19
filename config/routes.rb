Rails.application.routes.draw do
  get 'commitments/index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :hackdays do
    resources :projects
  end

  resources :projects do
    resources :goals
  end

  resources :goals do
    resource :commitment, only: [:create, :destroy]
  end

  root to: 'hackdays#index'
end
