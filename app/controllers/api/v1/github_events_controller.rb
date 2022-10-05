class Api::V1::GithubEventsController < ApplicationController

    def create
        GithubEventCreator.new(params[:user_id]).call
    end

    private

    def github_event_params
        params.require(:github_event).permit(:event_type,:event_id, :repo_name, :event_created_at, :status, :size, :number, :user_id)
    end

end