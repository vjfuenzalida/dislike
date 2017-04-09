Rails.application.routes.draw do
  get 'maps', to: "maps#index"
  get 'maps/show', to: "maps#show"


  resources :topics
  resources :votes



  devise_for :users
  root 'home#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
