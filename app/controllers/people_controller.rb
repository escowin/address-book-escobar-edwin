# MVC | controller
class PeopleController < ApplicationController
  # CRUD | get routes
  def index # view | ./views/persons/index.html.erb
    @people = Person.all # fetch person db request | displays the list of people
  end

  def show
    @person = Person.find(params[:id])
  end

  # CRUD | post routes
  # - instantiates new person; action maps to GET /people/new
  def new 
    @person = Person.new
  end

  def create 
    # instantiates with person parameter values
    @person = Person.new(person_params)
    
    # attempts to save person; action maps to POST /people; checks validations
    if @person.save
      redirect_to @person
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def person_params
      params.require(:person).permit(
        :firstname,
        :middlename,
        :lastname,
        :ssn,
        :dob,
        :comment
      )
    end
end
