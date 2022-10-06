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
            @name = "Passed 4 stars!"
        else
            @name = "This is something new"
        end
    end 
end