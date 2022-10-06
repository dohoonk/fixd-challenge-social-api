require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:comment) { FactoryBot.create(:comment) }

  describe "validation" do
    it "Should not let comment be created without message" do
      comment.message = nil
      expect(comment).to_not be_valid
    end
    
  end
end
