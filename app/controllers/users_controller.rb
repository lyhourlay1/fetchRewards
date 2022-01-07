class UsersController < ApplicationController

    def create 
        @user = User.create(user_params)
        if @user.save
            render json: "user saved"
        else
            render json: @user.errors.full_messages, status: 401
        end
    
    end

    def user_params
        params.require(:user).permit(:username)
    end
end
