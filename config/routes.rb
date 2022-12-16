Rails.application.routes.draw do
  # persons index is the default view
  root "persons#index"

  # CRUD operations
  # - read | getting the individuals in contacts.
  get "/persons", to: "persons#index" # controller | ./controllers/persons_controller.rb 
end
