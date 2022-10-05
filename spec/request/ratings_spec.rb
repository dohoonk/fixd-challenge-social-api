require 'rails_helper'

RSpec.describe 'Raitng', type: :request do
    describe 'Rating /posts' do
        context 'with valid parameters' do
            let!(:rating) { FactoryBot.create(:rating) }
            
            before do
                post '/api/v1/ratings', params: {
                    rating: {
                        user_id: rating.user.id,
                        rater_id: rating.rater.id,
                        rating: rating.rating
                    }
                }
            end

            it 'returns a created status' do
                expect(response).to have_http_status(:created)
            end
        end
    end
end