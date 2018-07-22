Rails.application.routes.draw do
  root 'houses#index'
  resources :houses, except: [:show]

  resources :houses, only: [:show] do
    resources :members
  end
end
