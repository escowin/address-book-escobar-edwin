Rails.application.routes.draw do
  # persons index is the default view
  # root "people#index"
  root to: "home#index"

  # sign up
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  # log in
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  # log out
  delete "logout", to: "sessions#destroy"

  # CRUD entities
  # people | ./controllers/persons_controller.rb
  resources :people do
    # nested entities
    resources :addresses, only: [:create, :edit, :update, :destroy]
    resources :emails
    resources :phone_numbers
  end
end
