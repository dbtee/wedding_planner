class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit, :update, :destroy, :edit_password, :update_password]
    before_action :correct_user, only: [:edit, :update]

    before_action :authorize!, only: [:index]

    def new
        @user = User.new
    end

    def create
        @user = User.new user_params

        if @user.save 
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end
    end


    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end



    # def index
    #     redirect_to root_path unless can?(:index, current_user)
    #     @users = User.all
    # end

    # def show
    #     redirect_to root_path unless can?(:show, current_user)
    # end

    # def new
    #     redirect_to root_path unless can?(:create, current_user)
    # end

    # def edit
    #     redirect_to root_path unless can?(:update, current_user)
    # end

    # def create
    #     redirect_to root_path unless can?(:create, current_user)
    #     @user = User.new(user_params)
    #     if @user.save
    #         redirect_to @user, notice: 'Guest was successfully created!'
    #     else
    #         render :new
    #     end
    # end

    # def update
    #     updating_user = User.find_by(id: params.require(:id))
    #     redirect_to root_path unless can?(:update, updating_user)

    #     if(current_user.is_admin=true && updating_user.update(user_params))
    #         flash[:notice] = 'Guest changes saved.'
    #         redirect_to user_path(updating_user)
    #     elsif(current_user.update(params.require(:user).permit(:email, :first_name, :last_name, :phone, :nationality, :allergies, :rsvp)))
    #     flash[:notice] = 'Profile changes saved.'
    #     else
    #         render :edit
    #     end
    # end

    # def edit_password
    #     redirect_to root_path unless can?(:edit_password, current_user)
    # end

    # def update_password
    #     redirect_to root_path unless can?(:edit_password, current_user)
    #     if @user&.authenticate(params[:user][:current_password])
    #         if @user.update(user_params) 
    #           flash[:notice] = "Profile changes saved."
    #           redirect_to user_path(@user)
    #         else
    #           flash[:notice] = "Passwords did not match."
    #           render :edit_password
    #         end
    #       else
    #         flash[:notice] = "Wrong current password."
    #         render :edit_password
    #       end
    #     end

    # def destroy
    #     if (current_user.is_admin=false)
    #         flash[:notice] = 'Only admin is authorized to do this.'
    #         redirect_to(root_path)
    #     else
    #         @user.destroy
    #         flash[:notice] = `Guest removed from guest list.`
    #         redirect_to users_path
    #     end
    # end

    # def filter
    #     @users= User.all
    #     @nationality= params[:nationality]
    #     @rsvp= params[:rsvp]
    #     render :index
    # end

    # private

    # def find_user
    #     @user = User.find(params[:id])
    # end

    # def correct_user
    #     redirect_to(root_path) unless (current_user== @user||
    #     current_user.is_admin=true)
    # end

    # def authorize!
    #     # redirect_to root_path unless can?(:index, current_user)
    # end
end