# MVC | controller
class PeopleController < ApplicationController
  # crud | get routes: /people/ & people/:id
  def index # view /people/index.html.erb
    @people = Person.all
  end

  def show # view /people/show.html.erb
    @person = Person.find(params[:id])
  end

  # crud | post /people/?
  def new # view | ../people/new.html.erb
    @person = Person.new
  end

  def create 
    # instantiates with person parameter values
    @person = Person.new(person_params)
    
    # attempts to save person; action maps to POST /people; checks validations
    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: "person successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # crud | update /people/:id |
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

  # crud | delete /people/:id |
  def destroy
    # fetches & deletes person
    @person = Person.find(params[:id])
    @person.destroy
    # redirect | /people/ |
    redirect_to people_path, status: :see_other
  end

  private
    def person_params
      params.require(:person).permit(
        :salutation,
        :firstname,
        :middlename,
        :lastname,
        :ssn,
        :dob,
        :comment
      )
    end
end
