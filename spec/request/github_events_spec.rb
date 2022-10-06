# require 'rails_helper'

# RSpec.describe 'GitHubEvents', type: :request do
#     describe 'POST /github_events' do
#         context 'with valid parameters' do
# 			let!(:github_event) { FactoryBot.create(:github_event) }
            
#             before do
#                 post '/api/v1/github_events', params: { user_id: github_event.user.id }
#             end

#             it 'returns a created status' do
#                 expect(response).to have_http_status(:created)
#             end
#         end
#     end

# end