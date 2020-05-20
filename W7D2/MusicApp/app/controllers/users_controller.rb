class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def index
    end

    def create
        user = User.new(user_params)
        if user.save
            log_in_user!(user)
            redirect_to bands_url
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user
            render :show
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end
end