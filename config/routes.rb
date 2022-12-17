Rails.application.routes.draw do
  # persons index is the default view
  root "people#index"

  # CRUD operations
  # - persons mvc, ./controllers/persons_controller.rb
  resources :people
end
