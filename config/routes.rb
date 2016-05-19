Rails.application.routes.draw do
  get 'commitments/index'

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :hackdays do
    resources :projects
  end

  resources :projects

  resources :goals do
    resource :commitment, only: [:create, :destroy]
  end

  root to: 'hackdays#index'
end
