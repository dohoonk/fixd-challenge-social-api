require 'rails_helper'

RSpec.describe GithubEvent, type: :model do
  let!(:github_event_1) { FactoryBot.create(:github_event) }
  let!(:github_event_2) { FactoryBot.create(:github_event) }

  describe "validation" do
    it "Should not let github_event to be created with same event_id with same user_id" do
      github_event_2.user_id = github_event_1.user_id
      expect(github_event_2).to be_valid
    end

  end
end
