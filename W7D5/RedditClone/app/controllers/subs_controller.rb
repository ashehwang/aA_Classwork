class SubsController < ApplicationController

    before_action :require_login, only: [:create, :update]

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id
        if @sub.save
            redirect_to subs_url
        else
            render :new
        end
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end
    
    def update
        @sub = Sub.find_by(id: params[:id])
        if @sub.update(sub_params)
            redirect_to subs_url
        else
        end
    end
    
    def index
        @subs = Sub.all 
        render :index
    end
    
    def show
        @sub = Sub.find_by(id: params[:id])
        @post = Post.new
        render :show
    end

    def sub_params
        params.require(:sub).permit(:title, :description, :moderator_id)
    end
end
