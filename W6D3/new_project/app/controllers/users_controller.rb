class UsersController < ApplicationController

    def index
        if params[:query]
            user = User.where("username like '%#{params[:query]}%'")
            render json: user
        else
            @users = User.all
            # render json: users
            render 'index' #can use 'index'
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save!
            redirect_to user_url(@user.id)
        else
            render :new   
        end
    end

    def new
        @user = User.new #placeholder
        render :new
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user
            render :show
        else
            redirect_to users_url
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
        render :edit
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to "/users/#{user.id}"
        else
            render :edit
        end
    end

    def destroy
        user = User.find(params[:id])
        if user.destroy
            render json: user
        else
            render json: user.errors.full_messages
        end
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end

end