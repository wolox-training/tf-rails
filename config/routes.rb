require 'sidekiq/web'
Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]
Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  mount Sidekiq::Web => '/sidekiq'
  resources :books, only: [:index, :show]
  resources :rents, only: [:create, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
