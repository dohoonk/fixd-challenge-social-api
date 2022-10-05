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
            subject: github_event,
            name: "Created a new repo #{repo_name}",
            user: user
          )
    end
end