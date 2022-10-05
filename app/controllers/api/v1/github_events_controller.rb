class Api::V1::GithubEventsController < ApplicationController

    def create
        user = User.find(params[:user_id])
        request = Faraday.get("https://api.github.com/users/#{user.github_username}/events/public")
        payloads   = JSON.parse(request.body)
        payloads.each do |payload|
            event_type = payload["type"]
            case event_type
                when "CreateEvent"
                    event_id = payload["id"]
                    repo_name = payload["repo"]["name"]
                    created_at = payload["created_at"]
                    github_event = GithubEvent.create(event_type: event_type, event_id: event_id, repo_name: repo_name, event_created_at: created_at, user_id: 1)
                    
                    ActivityLog.create(
                        subject: github_event,
                        name: "Created a new repo #{repo_name}",
                        user: user
                      )
                when "PushEvent"
                    event_id = payload["id"]
                    size = payload["payload"]["size"]
                    repo_name = payload["repo"]["name"]
                    created_at = payload["created_at"]
                    github_event = GithubEvent.create(event_type: event_type, event_id: event_id, size: size, repo_name: repo_name, event_created_at: created_at, user_id: 1)
                    
                    ActivityLog.create(
                        subject: github_event,
                        name: "Pushed #{size} commits to #{repo_name}",
                        user: user
                      )
                when "PullRequestEvent"
                    event_id = payload["id"]
                    status = payload["payload"]["action"]
                    number = payload["payload"]["number"]
                    repo_name = payload["repo"]["name"]
                    created_at = payload["created_at"]
                    github_event = GithubEvent.create(event_type: event_type, event_id: event_id, status: status, number: number, repo_name: repo_name, event_created_at: created_at, user_id: 1)
                    
                    ActivityLog.create(
                        subject: github_event,
                        name: "Created a new repo #{repo_name}",
                        user: user
                      )
                else
                    puts "Oooh, something new from GitHub: #{event_type}"
                end
                
        end

    
    end

    private

    def github_event_params
        params.require(:github_event).permit(:event_type,:event_id, :repo_name, :event_created_at, :status, :size, :number, :user_id)
    end

end