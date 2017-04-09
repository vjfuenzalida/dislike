Rails.application.routes.draw do
  get 'maps/show', to: "maps#show"
  get 'topics/display', to: "topics#display"

  resources :topics
  resources :votes

  devise_for :users
  root 'maps#show'
  resources :users, :only => [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
