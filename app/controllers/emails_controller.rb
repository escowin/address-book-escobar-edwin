class EmailsController < ApplicationController
    def create
        @person = Person.find(params[:person_id])
        @email = @person.emails.create(email_params)
        redirect_to person_path(@person)
    end

    def destroy
        @person = Person.find(params[:person_id])
        @email = @person.emails.find(params[:id])
        @email.destroy
        redirect_to person_path(@person)
    end

    private
        def email_params
            params.require(:email).permit(
                :email,
                :comment
            )
        end
end
