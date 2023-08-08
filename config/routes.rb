Rails.application.routes.draw do
  root 'sources#index'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  resources :sources, except: %i[show] do
    resources :source_pages
  end

  resources :products, except: %i[new create]
end
