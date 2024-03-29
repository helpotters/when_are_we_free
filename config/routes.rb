Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events, :voters
  get 'notify(/:id)', to: 'voters#notify', as: 'notify'
  get 'next(/:id)', to: 'events#next', as: 'next'

  # Defines the root path route ("/")
  root 'events#index'
end
