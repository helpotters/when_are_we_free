Rails.application.routes.draw do
  get 'voters/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events

  # Defines the root path route ("/")
  root "events#new"
end
