require 'rails_helper'

describe "As a logged in user" do
  describe "when I visit my profile page" do
    it "I see the correct number of repositories" do

      #create test object
      # omniauth.stub or Faker::Omniauth.github

      visit "/#{user.username}" #will need to slug this
      expect(page).to have_content("Repositories 42")
    end
  end
end
