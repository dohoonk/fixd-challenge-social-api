require 'faraday'
# need to hanlde cas when user does not have a github_username
class GithubEventCreator
    def initialize(user_id)
        @user_id = user_id
    end

    def call
        self.get_github_event
    end

    def get_github_event
        user = User.find(@user_id)
        request = Faraday.get("https://api.github.com/users/#{user.github_username}/events/public")
        parse_github_json(request)
    end

    def parse_github_json(request)
        payloads = JSON.parse(request.body)
        create_github_event(payloads)
    end

    def create_github_event(payloads)
        payloads.each do |payload|
            event_type = payload["type"]
            case event_type
            when "CreateEvent"
                create_event_create(event_type,payload)
            when "PushEvent"
                push_event_create(event_type,payload)
            when "PullRequestEvent"
                pull_request_event_create(event_type,payload)
            else
                puts "Oooh, something new from GitHub: #{event_type}"
            end
        end
    end

    private 


    def create_event_create(event_type,payload)
        event_id = payload["id"]
        repo_name = payload["repo"]["name"]
        created_at = payload["created_at"]
        GithubEvent.create(
            event_type: event_type, 
            event_id: event_id, 
            repo_name: repo_name, 
            event_created_at: created_at, 
            user_id: @user_id
        )
    end

    def push_event_create(event_type,payload)
        event_id = payload["id"]
        size = payload["payload"]["size"]
        repo_name = payload["repo"]["name"]
        created_at = payload["created_at"]
        branch_ref = payload['payload']['ref']
        GithubEvent.create(event_type: event_type,
            event_id: event_id,
            size: size,
            repo_name: repo_name,
            event_created_at: created_at,
            branch_ref: branch_ref, 
            user_id: @user_id
        )
    end 

    def pull_request_event_create(event_type,payload)
        event_id = payload["id"]
        status = payload["payload"]["action"]
        number = payload["payload"]["number"]
        repo_name = payload["repo"]["name"]
        created_at = payload["created_at"]
        GithubEvent.create(
            event_type: event_type, 
            event_id: event_id, 
            status: status, 
            number: number, 
            repo_name: repo_name, 
            event_created_at: created_at, 
            user_id: @user_id
        )
    end
end