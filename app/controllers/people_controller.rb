# MVC | controller
class PeopleController < ApplicationController
  # CRUD | read
  def index # view | ./views/persons/index.html.erb
    @people = Person.all # fetch person db request | displays the list of people
  end

  def show
    @person = Person.find(params[:id])
  end

  # CRUD | create
  # - instantiates new person
  def new
    @person = Person.new
  end

  # - instantiates with listed values & attempts to save. temp dummy values
  def create
    @person = Person.new(person_params)

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
