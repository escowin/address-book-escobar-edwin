class PhoneNumbersController < ApplicationController
    # crud | get renders as partial under person view

    # crud | post /people/:person_id/phone_numbers/?
    def create
        @person = Person.find(params[:person_id])
        @phone_number = @person.phone_numbers.create(phone_params)
        redirect_to person_path(@person)
    end

    # crud | update /people/:person_id/phone_numbers/:id
    def edit # view | ../phone_numbers/edit.html.erb
        @person = Person.find(params[:person_id])
        @phone_number = @person.phone_numbers.find(params[:id])
    end

    def update
        @person = Person.find(params[:person_id])
        @phone_number = @person.phone_numbers.find(params[:id])
        @phone_number.update(phone_params)
        if @phone_number.update(phone_params)
            redirect_to person_path(@person)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    # crud | delete /people/:person_id/phone_numbers/:id
    def destroy
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
