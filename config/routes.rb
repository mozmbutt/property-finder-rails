Rails.application.routes.draw do
  get 'dashboard/index'
  get 'dashboard/properties'
  get 'dashboard/reports'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  resources :properties
  devise_for :accounts
end
