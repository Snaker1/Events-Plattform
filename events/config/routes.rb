Rails.application.routes.draw do
  get 'rsvp/create'
  post 'rsvp/create'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "events#index"
  resources :users
  resources :events
end
