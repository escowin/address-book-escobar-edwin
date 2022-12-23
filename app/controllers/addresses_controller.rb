class AddressesController < ApplicationController
    # crud | get renders as partial under person view

    # crud | post /people/:person_id/phone_numbers/?
    def create
        @person = Person.find(params[:person_id])
        @address = @person.addresses.create(address_params)
        redirect_to person_path(@person)
    end

    # crud | update /people/:person_id/addresses/:id
    def edit # view | ../phone_numbers/edit.html.erb
        @person = Person.find(params[:person_id])
        @address = @person.addresses.find(params[:id])
    end

    def update
        @person = Person.find(params[:person_id])
        @address = @person.addresses.find(params[:id])
        @address.update(address_params)
        if @address.update(address_params)
            redirect_to person_path(@person)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    # crud | delete /people/:person_id/addresses/:id
    def destroy
        @person = Person.find(params[:person_id])
        @address = @person.addresses.find(params[:id])
        @address.destroy
        redirect_to person_path(@person)
    end

    # parameters
    private
        def address_params
            params.require(:address).permit(
                :street,
                :town,
                :zipcode,
                :state,
                :country
            )
        end
end
