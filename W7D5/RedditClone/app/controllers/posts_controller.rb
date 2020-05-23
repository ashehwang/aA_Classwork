class PostsController < ApplicationController

    before_action :require_login, only: [:create, :destroy]

    def new
        @sub = Sub.find_by(id: params[:sub_id])
        @post = Post.new
        render :new
    end
    
    def edit
        @post = Post.find_by(id: params[:id])
        render :edit
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to sub_url(@post.sub_id)
        else
            render :new
        end
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post.update(post_params)
            redirect_to subs_url
        else
            render :edit
        end
    end

    
    def destroy
        @post = current_user.posts.find_by(id: params[:post_id])
        if @post.destroy
        end
        redirect_to subs_url
    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_id, :user_id)
    end
end