require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
    describe 'POST /sessions' do
        context 'with invalid email and password' do
            let!(:user){ FactoryBot.create(:user) }

            before do
                post 'api/v1/sessions', params: {
                    email: user.email,
                    password: 'd'
                }
            end

            it 'returns a created status' do
                expect(response).to have_http_status(:unauthorized)
            end
            
        end

        context 'with valid email and password' do
            let!(:user){ FactoryBot.create(:user) }

            before do
                post 'api/v1/sessions', params: {
                    email: user.email,
                    password: 'chester'
                }
            end

            it 'returns a created status' do
                expect(response).to have_http_status(:created)
            end
            
        end
    end
end