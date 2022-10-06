require 'rails_helper'

RSpec.describe ActivityLogCreator do
    describe '#call' do
        context 'after comment create' do
            let!(:comment){ FactoryBot.create(:comment)}

            # One from post test case and one from comment
            it 'creates a activity_log from after_create call back' do
                expect(ActivityLog.count).to eq(2)
            end

            it 'creates a activity_log with subject comment' do
                expect(ActivityLog.last.subject.class.name).to be == "Comment"
            end
        end 

        context 'after post create' do
            let!(:post){ FactoryBot.create(:post)}

            it 'creates a activity_log from after_create call back' do
                expect(ActivityLog.count).to eq(1)
            end

            it 'creates a activity_log with subject post' do
                expect(ActivityLog.last.subject.class.name).to be == "Post"
            end
        end 

        context 'after rating create' do
            let!(:rating){ FactoryBot.create(:rating)}

            before do
                ActivityLogCreator.new(rating, rating.user_id).call
            end

            it 'creates a activity_log' do
                expect(ActivityLog.count).to eq(1)
            end

            it 'creates a activity_log with subject rating' do
                expect(ActivityLog.last.subject.class.name).to be == "Rating"
            end
        end 

        context 'after github_event create' do
            let!(:github_event){ FactoryBot.create(:github_event)}

            it 'creates a activity_log from after_create call back' do
                expect(ActivityLog.count).to eq(1)
            end

            it 'creates a activity_log with subject github_event' do
                expect(ActivityLog.last.subject.class.name).to be == "GithubEvent"
            end
        end 
        
    end 
end