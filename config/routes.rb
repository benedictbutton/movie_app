Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  post 'authenticate', to: 'authentication#authenticate'
  post 'forgot_password', to: 'authentication#forgot_password'
  get 'reset_request/:id', to: 'authentication#reset_request'
  post 'change_password', to: 'authentication#change_password'

  namespace :api do
    namespace :v1 do
      resources 'playlists' do
        collection do
          put 'active', to: 'playlists#active', as: 'active'
        end
        collection do
          get 'setup', to: 'playlists#setup', as: 'setup'
        end
      end
      resources :users, :movies, :ratings, :movies_playlists
    end
  end
end
