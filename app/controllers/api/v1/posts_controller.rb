class Api::V1::PostsController < ApplicationController
    def create
        post = Post.new(post_params)
    
        if post.save
            render json: post, status: :created
        else
            render json: post.errors, status: :unprocessable_entity
        end
    end

    def show
        @post = Post.find(params[:id])
        render 'posts/show', formats: [:json], handlers: [:jbuilder], status: 201
    end

    private

    def post_params
		params.require(:post).permit(:title, :body, :user_id)
	end
end