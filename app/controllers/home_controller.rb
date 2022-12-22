class HomeController < ApplicationController
    def index
        if session[:user_id]
            # find_by | prevents app from crashing if user is deleted from db
            @user = User.find_by(id: session[:user_id])
        end
    end
end