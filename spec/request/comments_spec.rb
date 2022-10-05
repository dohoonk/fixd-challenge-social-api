require 'rails_helper'

RSpec.describe 'Comments', type: :request do
    describe 'POST /comments' do
        context 'with valid parameters' do
			let!(:comment) { FactoryBot.create(:comment) }
            
            before do
                post '/api/v1/comments', params: { 
                    comment: {
                            user_id: comment.user.id,
                            post_id: comment.post.id,
                            message: comment.message
                          } 
                        }
            end

            it 'returns a created status' do
                expect(response).to have_http_status(:created)
            end
        end

        context 'with invalid parameters' do
			let!(:comment) { FactoryBot.create(:comment) }

            before do
                post '/api/v1/comments', params: { 
                    comment: {
                            user_id: '',
                            post_id: comment.post.id,
                            message: comment.message
                          } 
                }
            end

          it 'returns a unprocessable entity status' do
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
    end

    describe 'DELETE /comments' do
        context 'with valid parameters' do
			let!(:comment) { FactoryBot.create(:comment) }
            
            before do
                delete "/api/v1/comments/#{comment.id}"
            end

            it 'returns a created status' do
                expect(response).to have_http_status(:no_content)
            end
        end

        context 'with invalid comment id' do
			let!(:comment) { FactoryBot.create(:comment) }

            before do
                delete "/api/v1/comments/#{comment.id + 10000000}"
            end

          it 'returns a unprocessable entity status' do
            expect(response).to have_http_status(:not_found)
          end
        end
    end
end