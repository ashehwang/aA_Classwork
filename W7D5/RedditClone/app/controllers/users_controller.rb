class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to subs_url
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:password, :username)
    end
end
