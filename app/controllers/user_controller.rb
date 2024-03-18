class UserController < ApplicationController 
    def index
        @user = User.new
        render :signup
    end

    def create
        @user = User.new(user_params)

        if @user.save
            # Handle successful creation
            redirect_to signup_path, notice: "User created successfully."
        else
            render :signup
        end
    end

    @private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end