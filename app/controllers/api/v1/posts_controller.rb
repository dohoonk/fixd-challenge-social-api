class Api::V1::PostsController < ApplicationController
    def create
        post = Post.new(post_params)
        
        if post.save
            ActivityLogCreator.new(post, post.user_id).call
            render json: post, status: :created
        else
            render json: post.errors, status: :unprocessable_entity
        end
    end

    private

    def post_params
		params.require(:post).permit(:title, :body, :user_id)
	end
end