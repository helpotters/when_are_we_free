Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events, :voters
  get 'notify(/:id)', to: 'events#notify'
  patch 'voters/:id/edit', to: 'voters#edit'

  # Defines the root path route ("/")
  root 'events#index'
end
