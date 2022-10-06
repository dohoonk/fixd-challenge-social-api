class Api::V1::FeedsController < ApplicationController
    def index
        # below method call will slow down the endpoint. Most ideal workaround would be to create
        # a scheduled job that pulls from Github Api every 5 mins as github documentation
        # states that their data is delayed by 5 mins.
        GithubEventCreator.new(params[:user_id]).call
        @user = User.find(params[:user_id])
        render 'feeds/index', formats: [:json], handlers: [:jbuilder], status: 201
    end
end