class ApplicationController < ActionController::API   
    rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def not_destroyed(e)
        render json: { errors: e.record.errors }, status: :unprocessable_entity
    end

    def not_found(e)
        render json: { error: e.to_s }, status: :not_found
    end
end
