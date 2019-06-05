Rails.application.routes.draw do
  
  get 'relationship/create'
  get 'relationship/destroy'
  get 'create/destroy'
  root 'home#top'
  
  devise_for :companies
  devise_for :colleges

  get 'home/top'
  
  get '/colleges/:id', to: 'colleges#show', as: 'college'
  get '/companies/:id', to: 'companies#show', as: 'company'
   get '/companies', to: 'companies#index', as: 'company2'
  get '/users/:id', to: 'users#show', as: 'user'
  
  # get 'products/index'
  # get 'products/new'
  # post 'products/create'
  # post 'products/all_destroy'
  # get 'products/:id' => 'products#show'
  # get 'products/:id/edit' => 'products#edit'
  # post 'products/:id/update' => 'products#update'
  # post 'products/:id/destroy' => 'products#destroy'
  
  resources :products do
    
    resources :pictures, only: [:create]
    
    collection do
      match 'search' => 'home#search', via: [:get, :post], as: :search
    end
  end
  
  resources :colleges do
    collection do
      match 'search' => 'home#search', via: [:get, :post], as: :search
    end
  end
  
  resources :companies do
    collection do
      match 'search' => 'home#search', via: [:get, :post], as: :search
    end
  end
  
  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
