Rails.application.routes.draw do
  # persons index is the default view
  root "people#index"

  # CRUD entities
  # people | ./controllers/persons_controller.rb
  resources :people do
    # nested entities
    resources :addresses, only: [:create, :edit, :update, :destroy]
    resources :emails
    resources :phone_numbers
  end
end
