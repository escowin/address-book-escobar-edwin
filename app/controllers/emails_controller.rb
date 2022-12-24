class EmailsController < ApplicationController
    # crud | get renders as partial under person view

    # crud | post a new person |
    def create
        # routes | /people/:person_id/emails/?
        @person = Person.find(params[:person_id])
        @email = @person.emails.create(email_params)
        redirect_to person_path(@person)
    end

    # crud | update a person |
    def edit # view | ../emails/edit.html.erb
        # route | /people/:person_id/emails/:id
        @person = Person.find(params[:person_id])
        @email = @person.emails.find(params[:id])
    end

    def update
        # route | /people/:person_id/emails/:id
        @person = Person.find(params[:person_id])
        @email = @person.emails.find(params[:id])
        if @email.update(email_params)
            # redirect | /people/
            redirect_to person_path(@person)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    # crud | delete a person |
    def destroy
        # route | /person/:person_id/phone_numbers/:id
        @person = Person.find(params[:person_id])
        @email = @person.emails.find(params[:id])
        @email.destroy
        #  redirect | /people/
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
