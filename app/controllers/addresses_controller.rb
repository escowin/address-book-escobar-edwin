class AddressesController < ApplicationController
    def create
        @person = Person.find(params[:person_id])
        @address = @person.addresses.create(address_params)
        redirect_to person_path(@person)
    end

    def destroy
        @person = Person.find(params[:person_id])
        @address = @person.addresses.find(params[:id])
        @address.destroy
        redirect_to person_path(@person)
    end

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
