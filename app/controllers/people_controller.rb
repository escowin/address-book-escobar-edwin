# MVC | controller
class PeopleController < ApplicationController
  # CRUD | get routes
  def index # view | ./views/people/index.html.erb
    @people = Person.all # fetch person db request | displays the list of people
  end

  def show
    @person = Person.find(params[:id])
  end

  # CRUD | post routes
  def new # view | ./views/people/new.html.erb
    # instantiates new person; action maps to GET /people/new
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

  # CRUD | update routes.
  def edit # view | ./views/people/edit.html.erb
    # fetches person from database, stores values in @person for form building. 
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      redirect_to @person
    else
      render :edit, status: :unprocessable_entity
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
