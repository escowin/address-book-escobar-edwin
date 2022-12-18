# MVC | controller
class PeopleController < ApplicationController
  # CRUD | get routes
  def index # view | ./views/people/index.html.erb
    # gets all people
    @people = Person.all
  end

  def show
    # gets a specfici person
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

  # CRUD | update routes
  def edit # view | ./views/people/edit.html.erb
    # fetches person from database, stores values in @person for form building. 
    @person = Person.find(params[:id])
  end

  def update # re-fetches person from db
    @person = Person.find(params[:id])

    # updates person with parameter-filtered data submitted from form
    if @person.update(person_params) #
      redirect_to @person
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # CRUD | delete route
  def destroy
    # fetches & deletes person
    @person = Person.find(params[:id])
    @person.destroy

    # browser redirect
    redirect_to root_path, status: :see_other
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
