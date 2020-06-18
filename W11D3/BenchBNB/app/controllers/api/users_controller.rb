class Api::UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            debugger
            render 'api/users/show'
        else
            render json: ["Please try again"]
        end
    end 

    def show
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
