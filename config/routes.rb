Rails.application.routes.draw do
  # persons index is the default view
  # root "people#index"
  root to: "home#index"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  delete "logout", to: "sessions#destroy"

  # CRUD entities
  # people | ./controllers/persons_controller.rb
  resources :people do
    # nested entities
    resources :addresses
    resources :emails
    resources :phone_numbers
  end
end
