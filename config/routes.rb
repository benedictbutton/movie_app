Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  post 'authenticate', to: 'authentication#authenticate'

  namespace :api do
    namespace :v1 do
        resources :users
        resources :movies
    end
  end
end
