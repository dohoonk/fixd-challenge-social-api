class ActivityLogCreator
    def initialize(subject, user_id)
        @subject = subject
        @user_id = user_id
    end

    def call
        self.create_activity_log
    end

    private 

    def create_activity_log
      
         ActivityLog.create(
            subject: @subject,
            name: find_name,
            user_id: @user_id
         )
    end

    def find_name
        case @subject.class.name
        when "Comment"
           @name = "Commented on a post by #{@subject.user.name}"
        when "Post"
            @name = "#{@subject.title}"
        when "Rating"
            @name = "Passed 4 stars!"
        when "GithubEvent"
            githube_event_name_generator
        else
            @name = "This is something new"
        end
    end 

    def githube_event_name_generator
        case @subject.event_type
        when "CreateEvent"
            @name = "Created a new repository #{@subject.repo_name}"
        when "PushEvent"
            @name = "Pushed #{@subject.size} commits to #{@subject.repo_name}"
        when "PullRequestEvent"
            if @subject.status == 'open'
                @name = "Merged #{"#" + @subject.number.to_s} into #{@subject.repo_name}"
            else
                @name = "Opened a new Pull Request #{"#" + @subject.number.to_s}"
            end
        end
    end
end