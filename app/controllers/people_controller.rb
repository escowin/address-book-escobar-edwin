# MVC | controller
class PeopleController < ApplicationController

  # crud | read get routes
  def index # view /people/index.html.erb
    @people = Person.all
  end

  def show # view /people/show.html.erb
    @person = Person.find(params[:id])
  end

  # crud | create post routes
  def new # view | ../people/new.html.erb
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

  # crud | update routes
  def edit # view | ../people/edit.html.erb
    @person = Person.find(params[:id])
  end

  def update # re-fetches person from db
    @person = Person.find(params[:id])
    if @person.update(person_params) #
      redirect_to @person
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # crud | delete route
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
