class ActivityLogCreator
    def initialize(subject, user_id, name)
        @subject = subject
        @user_id = user_id
        @name    = name
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