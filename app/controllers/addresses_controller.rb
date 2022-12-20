class AddressesController < ApplicationController
    # crud | create get route
    def create
        @person = Person.find(params[:person_id])
        @address = @person.addresses.create(address_params)
        redirect_to person_path(@person)
    end

    # crud | update routes
    # edit_person_address
    # GET
    # /people/:person_id/addresses/:id/edit(.:format)
    # addresses#edit
    def edit
        @address = Address.find(params[:id])
    end

    def update
        @address = Address.find(params[:id])
        if @address.update(address_params)
            redirect_to post_path(@person.address)
        else
            render :edit, status: :unprocessable_entity
    end

    # crud | delete route
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
end
