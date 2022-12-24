class AddressesController < ApplicationController
    # crud | get renders as partial under person view |

    # crud | post a new address |
    def create
        # route | /people/:person_id/phone_numbers/?
        @person = Person.find(params[:person_id])
        @address = @person.addresses.create(address_params)
        redirect_to person_path(@person)
    end

    # crud | update an address |
    def edit # view | ../phone_numbers/edit.html.erb
        # route | /people/:person_id/addresses/:id 
        @person = Person.find(params[:person_id])
        @address = @person.addresses.find(params[:id])
    end

    def update
        # route | /people/:person_id/addresses/:id 
        @person = Person.find(params[:person_id])
        @address = @person.addresses.find(params[:id])
        if @address.update(address_params)
            redirect_to person_path(@address.person)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    # crud | delete an address | 
    def destroy
        #  route | /people/:person_id/addresses/:id
        @person = Person.find(params[:person_id])
        @address = @person.addresses.find(params[:id])
        @address.destroy
        #  redirect | /people/
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
