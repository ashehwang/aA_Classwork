class CommentsController < ApplicationController

    def index
        if params.has_key?(:user_id)
            user_comment = User.find(params[:user_id])
            render json: user_comment.comments
        elsif params.has_key?(:artwork_id)
            art = Artwork.find(params[:artwork_id])
            render json: art.comments
        else
            comments = Comment.all 
            render json: comments
        end
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save!
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity    
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        if comment.destroy
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
    
    def comment_params
        params.require(:comment).permit(:body, :user_id, :artwork_id)
    end

end