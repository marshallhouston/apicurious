require 'rails_helper'

describe "As an authenticated user" do
  describe "when I visit my profile page" do
    it "I see my user github information" do
      # As an authenticated user,
      # user = create :user
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      stub_omniauth

      visit root_path
      click_link "Login with Github"

      # after I successfully log in,
      click_on "Profile"
      # I should see my profile pic,
      expect(page).to have_css("profile_picture")
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
        expect(page).to have_content("Followers 2")
      end
      # following
      within(".following") do
        expect(page).to have_content("Following 6")
      end
    end
  end
end
