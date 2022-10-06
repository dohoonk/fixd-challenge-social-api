class Api::V1::CommentsController < ApplicationController
    before_action :set_post, only: :create

    def create
    
        comment = @post.comments.build(comment_params)

        if comment.save
            render json: comment, status: :created
        else
            render json: comment.errors, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find(params[:id]).destroy!

        head :no_content
    end

    private

    def set_post
        @post = Post.find(params[:comment][:post_id])
    end

    def comment_params
        params.require(:comment).permit(:message, :post_id, :user_id)
    end

end