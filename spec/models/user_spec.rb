require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user)  { create(:user) }

  describe "GET rating in User model" do
    it "must be greater than 5" do
      expect(user.rating).to be > 5
    end
  end
end