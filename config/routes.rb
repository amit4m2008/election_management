Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'dashboard#index'

  namespace :api do
    namespace :v1 do
      resources :groups, only: [:index, :create]
      resources :users, only: [:index, :create]
      resources :elections, only: [:index, :create]
      resources :votes, only: [:index, :create]
    end
  end
end
