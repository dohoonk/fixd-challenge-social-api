class AverageRatingCreator
    def initialize(user_id, rater_id)
        @user_id = user_id
        @rater_id = rater_id
    end

    def call
        self.user_average_rating
    end

    private 

    def user_average_rating
        new_average_rating = Rating.where(user_id: @user_id).average(:rating)
        User.find(@user_id).update!(average_rating: new_average_rating)
    end
end