Rails.application.routes.draw do
  devise_for :companies
  devise_for :colleges
  root to: 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
