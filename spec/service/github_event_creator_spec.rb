require 'rails_helper'
require 'faraday'

describe GithubEventCreator do
  context '.create_event_create' do
    let!(:user){ FactoryBot.create(:user) }
    before do
      payload = [{"id"=>"24421650358", "type"=>"CreateEvent", "repo"=>{"id"=>545761346, "name"=>"dohoonk/fixd-challenge-social-api", "url"=>"https://api.github.com/repos/dohoonk/fixd-challenge-social-api"}, "payload"=>{"ref"=>"tony-feature-github-event", "ref_type"=>"branch", "master_branch"=>"main", "description"=>nil, "pusher_type"=>"user"}, "created_at"=>"2022-10-05T20:55:09Z"}]
      @github_event = GithubEventCreator.new(user.id).create_github_event(payload)
    end

    it 'creates github_event with event_type CrateEvent' do    
      expect(@github_event[0]["type"]).to be == "CreateEvent"
      expect(GithubEvent.count).to eq(1)
    end

    it 'creates github_event beloning to the correct user' do    
      expect(GithubEvent.last.user.id).to eq(user.id)
    end
  end

  context '.push_event_create' do
    let!(:user){ FactoryBot.create(:user) }
    before do
      payload = [{"id"=>"24421650358", "type"=>"PushEvent", "repo"=>{"id"=>545761346, "name"=>"dohoonk/fixd-challenge-social-api", "url"=>"https://api.github.com/repos/dohoonk/fixd-challenge-social-api"}, "payload"=>{"ref"=>"tony-feature-github-event", "ref_type"=>"branch", "master_branch"=>"main", "description"=>nil, "pusher_type"=>"user"}, "created_at"=>"2022-10-05T20:55:09Z"}]
      @github_event = GithubEventCreator.new(user.id).create_github_event(payload)
    end

    it 'creates github_event with event_type PushEvent' do    
      expect(@github_event[0]["type"]).to be == "PushEvent"
      expect(GithubEvent.count).to eq(1)
    end

  end

  context '.pull_request_event_create' do
    let!(:user){ FactoryBot.create(:user) }
    before do
      payload = [{"id"=>"24421650358", "type"=>"PullRequestEvent", "repo"=>{"id"=>545761346, "name"=>"dohoonk/fixd-challenge-social-api", "url"=>"https://api.github.com/repos/dohoonk/fixd-challenge-social-api"}, "payload"=>{"ref"=>"tony-feature-github-event", "ref_type"=>"branch", "master_branch"=>"main", "description"=>nil, "pusher_type"=>"user"}, "created_at"=>"2022-10-05T20:55:09Z"}]
      @github_event = GithubEventCreator.new(user.id).create_github_event(payload)
    end

    it 'creates github_event with event_type PullRequestEvent' do    
      expect(@github_event[0]["type"]).to be == "PullRequestEvent"
      expect(GithubEvent.count).to eq(1)
    end
  end

end