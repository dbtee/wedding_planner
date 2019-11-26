class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.new
        user = User.find_by_last_name params[:last_name]
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            
            if user.is_admin? || user.rsvp > 0
            redirect_to root_path, notice: "Welcome " + user.first_name
            else redirect_to edit_user_path(current_user)
            end
            
        else
            flash[:alert] = "Wrong name or password"
            render :new
        end
    end

    def destroy
        session[:user_id] =nil
        redirect_to root_path, notice: "See you soon!"
    end

end
