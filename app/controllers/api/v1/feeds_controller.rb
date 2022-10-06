class Api::V1::FeedsController < ApplicationController
    include Paginable
    def show
        # below method call will slow down the endpoint. Most ideal workaround would be to create
        # a scheduled job that pulls from Github Api every 5 mins as github documentation
        # states that their data is delayed by 5 mins.
        # @user = User.find(params[:user_id])
        @user = User.find(params[:id])
        if @user.github_username?
            GithubEventCreator.new(@user.id).call
        end

        @activity_logs = @user.activity_logs.includes(:subject).page(params[:page]).per(25)
        @options = get_links_serializer_options('api_v1_feed_path',@activity_logs)
 
        render 'feeds/show', formats: [:json], handlers: [:jbuilder], status: 201
    end
end