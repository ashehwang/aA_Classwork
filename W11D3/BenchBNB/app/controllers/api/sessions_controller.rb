class Api::SessionsController < ApplicationController

    def create
      @user = User.find_by_credentials(
        params[:user][:username], 
        params[:user][:password]
      )
      if @user
        login(@user)
        render "api/users/show"
      else
        render json: ["Invalid username/password."], status: 401
      end
    end

    def destroy
      @user = current_user
      if @user
        logout
        render json: ["logout successful! bye! never come back!"]
      else
        render json: ["No user to sign out"] , status: 401
      end

    end
end