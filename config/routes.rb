Rails.application.routes.draw do
  root 'sources#index'

  resources :sources, except: %i[show] do
    resources :source_pages
  end

  resources :products, except: %i[new create]
end
