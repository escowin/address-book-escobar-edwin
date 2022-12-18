class PhoneNumbersController < ApplicationController
    def create
        @person = Person.find(params[:person_id])
        @phone_number = @person.phone_numbers.create(phone_params)
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
