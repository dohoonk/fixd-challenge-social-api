require 'rails_helper'

RSpec.describe Rating, type: :model do
  let!(:rating) { FactoryBot.create(:rating) }

  describe "validation" do
    it "Should not let rating be created without rating" do
      rating.rating = nil
      expect(rating).to_not be_valid
    end

  end
end
