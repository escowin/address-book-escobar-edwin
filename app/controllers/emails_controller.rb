class EmailsController < ApplicationController
    # crud | get renders as partial under person view

    # crud | post /people/:person_id/emails/?
    def create
        @person = Person.find(params[:person_id])
        @email = @person.emails.create(email_params)
        redirect_to person_path(@person)
    end

    # crud | update  /people/:person_id/emails/:id
    def edit # view | ../emails/edit.html.erb
        @person = Person.find(params[:person_id])
        @email = @person.emails.find(params[:id])
    end

    def update
        @person = Person.find(params[:person_id])
        @email = @person.emails.find(params[:id])
        # redirects after posting update
        if @email.update(email_params)
            redirect_to person_path(@person)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    # crud | delete /person/:person_id/phone_numbers/:id
    def destroy
        @person = Person.find(params[:person_id])
        @email = @person.emails.find(params[:id])
        @email.destroy
        redirect_to person_path(@person), status: :see_other
    end

    private
        def email_params
            params.require(:email).permit(
                :email,
                :comment
            )
        end
end
