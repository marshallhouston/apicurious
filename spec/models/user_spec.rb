require 'rails_helper'

RSpec.describe User, type: :model do
  describe "attributes" do
    it "has a username" do
      user = create :user

      expect(user.username).to be_truthy
    end
  end
end
