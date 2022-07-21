Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :revenue do
        resources :merchants, only: [:index]
      end
      namespace :merchants do 
        get '/most_items', to: 'most_items#index'
        get '/find', to: 'merchant_search#find'
      end
      resources :merchants, only: %i[index show] do
        resources :items, only: %i[index], controller:'merchant_items'
      end
      resources :items do 
        get '/merchant', to: 'item_merchant#show'
      end
    end
  end
end
