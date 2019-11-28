class WelcomeController < ApplicationController
    before_action :authenticate_user!
    
    def index
        if current_user.rsvp < 1
            redirect_to edit_user_path(current_user)
        end
    end
end
