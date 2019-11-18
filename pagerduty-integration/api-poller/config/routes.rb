Rails.application.routes.draw do

  resources :endpoint_configs
  # resources :endpoint_alerts
  resources :integration_alerts
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  root to: 'pages#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
