require 'rails_helper'

RSpec.describe 'Posts', type: :request do
    describe 'POST /posts' do
        context 'with valid parameters' do
            let!(:user){ FactoryBot.create(:user) }
			let!(:test_post) { FactoryBot.build(:post) }

            before do
                post '/api/v1/posts', params: { 
                    post: {
                            title: test_post.title,
                            body: test_post.body,
                            user_id: user.id
                          } 
                }
            end

            it 'returns a created status' do
                expect(response).to have_http_status(:created)
            end
        end

        context 'with invalid parameters' do
            let!(:user){ FactoryBot.create(:user) }
			let!(:test_post) { FactoryBot.build(:post) }

            before do
                post '/api/v1/posts', params:
                { post: {
                title: '',
                body: '',
                user_id: ''
                } }
            end

          it 'returns a unprocessable entity status' do
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
    end
end