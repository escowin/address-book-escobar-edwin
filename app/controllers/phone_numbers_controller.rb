class PhoneNumbersController < ApplicationController
    # crud | get renders as partial under person view

    # crud | post a new phone number |
    def create
        # route | /people/:person_id/phone_numbers/?
        @person = Person.find(params[:person_id])
        @phone_number = @person.phone_numbers.create(phone_params)
        redirect_to person_path(@person)
    end

    # crud | update a phone number |
    def edit # view | ../phone_numbers/edit.html.erb
        # route | /people/:person_id/phone_numbers/:id
        @person = Person.find(params[:person_id])
        @phone_number = @person.phone_numbers.find(params[:id])
    end

    def update
        # route | /people/:person_id/phone_numbers/:id
        @person = Person.find(params[:person_id])
        @phone_number = @person.phone_numbers.find(params[:id])
        @phone_number.update(phone_params)
        if @phone_number.update(phone_params)
            redirect_to person_path(@person)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    # crud | delete a person |
    def destroy
        # route | /people/:person_id/phone_numbers/:id
        @person = Person.find(params[:person_id])
        @phone_number = @person.phone_numbers.find(params[:id])
        @phone_number.destroy
        redirect_to person_path(@person)
    end

    private
        def phone_params
            params.require(:phone_number).permit(
                :phone,
                :comment
            )
        end
end
