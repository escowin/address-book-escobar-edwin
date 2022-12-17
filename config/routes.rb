Rails.application.routes.draw do
  # persons index is the default view
  root "persons#index"

  # CRUD operations
  # - persons mvc, ./controllers/persons_controller.rb
  resources :persons
end
