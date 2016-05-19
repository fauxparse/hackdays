Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :hackdays do
    resources :projects
  end

  resources :projects

  root to: 'hackdays#index'
end
