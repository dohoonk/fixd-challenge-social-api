module CreateActivityLog
    extend ActiveSupport::Concern
    
    def create_activity_log
        ActivityLogCreator.new(self, self.user_id).call
    end
end