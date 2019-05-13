Rails.application.routes.draw do
  root to: 'mushrooms#index'
  resources :mushrooms
end
