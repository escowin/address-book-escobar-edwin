# MVC | controller
class PersonsController < ApplicationController
  def index # view | ./views/persons/index.html.erb
    @persons = Person.all # fetch person db request | displays the list of people
  end
end
