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
        find_user
        @current_average_rating = @user.average_rating
        @new_average_rating = Rating.where(user_id: @user_id).average(:rating)
        update_user_average_rating
        if @current_average_rating < 4.0 && @new_average_rating >= 4.0
            ActivityLogCreator.new(@user.rating.last, @user.id).call
        end
    end


    def update_user_average_rating
        @user.update!(average_rating: @new_average_rating)
    end

    def find_user
        @user = User.find(@user_id)
    end
end