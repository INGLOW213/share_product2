Rails.application.routes.draw do
  devise_for :companies
  devise_for :colleges
  get 'home/top'
  
  get 'products/index'
  get 'products/new'
  post 'products/create'
  post 'products/all_destroy'
  get 'products/:id' => 'products#show'
  get 'products/:id/edit' => 'products#edit'
  post 'products/:id/update' => 'products#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
