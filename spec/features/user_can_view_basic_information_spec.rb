require 'rails_helper'

describe "As an authenticated user" do
  describe "when I visit my profile page" do
    it "my user github information" do

      #create test object
      
      # omniauth.stub or Faker::Omniauth.github

      # As an authenticated user,
      # after I successfully log in,
      # I should see my profile pic,
      within(".profile_picture") do
        expect(page).to have_css("img")
      end
      # repositories with number,
      within(".repositories") do
        expect(page).to have_content("Repositories 42")
      end
      # number of starred repos,
      within(".starred_repos") do
        expect(page).to have_content("Starred 6")
      end
      # followers, and
      within(".followers") do
        expect(page).to have_content("Followers 6")
      end

      # following
      within(".following") do
        expect(page).to have_content("Following 2")
      end

      visit "/#{user.username}" #will need to slug this
    end
  end
end
