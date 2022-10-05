class Api::V1::CommentsController < ApplicationController
    before_action :set_post, only: :create
    # WIP to be refactored
    rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

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

    # WIP to be refactored
    def not_destroyed(e)
        render json: { errors: e.record.errors }, status: :unprocessable_entity
    end

    def not_found(e)
        render json: { error: e.to_s }, status: :not_found
    end

end