class AddressesController < ApplicationController
    # crud | get renders as partial under person view |

    # crud | post a new person |
    def create
        # route | /people/:person_id/phone_numbers/?
        @person = Person.find(params[:person_id])
        @address = @person.addresses.create(address_params)
        redirect_to person_path(@person)
    end

    # crud | update a person |
    def edit # view | ../phone_numbers/edit.html.erb
        # route | /people/:person_id/addresses/:id 
        @person = Person.find(params[:person_id])
        @address = @person.addresses.find(params[:id])
    end

    def update
        # route | /people/:person_id/addresses/:id 
        @person = Person.find(params[:person_id])
        @address = @person.addresses.find(params[:id])
        # ::bug:: update method behaves as create. 
        if @address.update(address_params)
            redirect_to person_path(@person)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    # crud | delete a person | 
    def destroy
        #  route | /people/:person_id/addresses/:id
        @person = Person.find(params[:person_id])
        @address = @person.addresses.find(params[:id])
        #  ::bug:: destroy method fails, see: views/addresses/_address.html.erb:32
        @address.destroy
        #  redirect | /people/ | ::bug:: edit & update behave as new & create. 
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
