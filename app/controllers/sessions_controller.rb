class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new
        user = User.find_by_last_name params[:last_name]
        if user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Welcome " + user.first_name
        else
            flash[:alert] = "Wrong name or password"
            render :new
        end
    end

    def destroy
        session[:user_id] =nil
        redirect_to root_path, notice: "See you soon!"
    end

    def authenticate_user!
        unless user_signed_in?
            flash[:danger] = "Please enter your name and the password displayed on the invitation"
        end
    end
end
