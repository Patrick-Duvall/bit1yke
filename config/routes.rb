Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/:id', to: 'short_links#show'
  get '/analytics/:id', to: 'analytics#show'
  resources :short_links, only: [:create]
  
end
