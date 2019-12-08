class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit, :update, :destroy, :edit_password, :update_password]
    before_action :correct_user, only: [:edit, :update]
    before_action :authorize!, only: [:index]


    def new
        @user = User.new
    end

    def create
        @user = User.new user_params

        if @user.save && current_user.is_admin=true
            flash[:notice] = 'Guest successfully added.'
            redirect_to root_path
        else
            render :new
        end
    end

    def index
        @users = User.all.order('full_name')
    end
     

    # def filter
    #     @nationality = params[:nationality]
    #     @table_num = params[:table_num]
        
    #     @users = User.all.order('created_at DESC')

    #     if params[:allergies].present?
    #         @users = User.all.allergies
    #     end

    #     if params[:is_admin].present?
    #         @users = User.all.is_admin
    #     end

    #     if params[:nationality].present?
    #         @users = User.nationality(@nationality)
    #     end

    #     if params[:table_num].present?
    #         @users = User.table_num(@table_num)
    #     end
    # end

    def show
        redirect_to root_path unless can?(:show, current_user)
    end

    def edit

    end

    def update
        updating_user = User.find_by(id: params.require(:id))
        redirect_to root_path unless can?(:update, updating_user)

        if(current_user.update(params.require(:user).permit(:email, :phone, :nationality, :allergies, :rsvp)))

            flash[:notice] = 'Profile changes saved.'
            redirect_to tables_path
        else
            render :edit
        end
    end


    def destroy
        if (current_user.is_admin?)
            @user.destroy
            flash[:notice] = "Guest removed from guest list."
            redirect_to users_path

        else
            flash[:notice] = 'Only admin is authorized to do this.'
                redirect_to(root_path)
        end
    end



################################################################
    private
    
    def find_user
        @user = User.find(params[:id])
    end

     def correct_user
         redirect_to(root_path) unless (current_user== @user||
         current_user.is_admin=true)
     end

     def user_params
        params.require(:user).permit(:rsvp, :email, :full_name, :password, :allergies, :phone, :is_admin)
      end

    def authorize!
         redirect_to root_path unless can?(:index, current_user)
    end
end