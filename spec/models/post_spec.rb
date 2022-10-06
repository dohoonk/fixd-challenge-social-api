require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:post) { FactoryBot.create(:post) }

  describe "validation" do
    it "Should not let post be created without title" do
      post.title = nil
      expect(post).to_not be_valid
    end

    it "Should not let post be created without body" do
      post.body = nil
      expect(post).to_not be_valid
    end

  end
end
