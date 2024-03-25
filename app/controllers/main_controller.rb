class MainController < ApplicationController 
    def index
        is_logged_in = session[:user_id]
        if is_logged_in
            @users = User.all()
        end
    end
end
