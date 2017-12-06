require 'rails_helper'

describe "As an authenticated user" do
  describe "when I visit my profile page" do
    it "I see my user github information" do
      # As an authenticated user,
      user = create :user
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      github_user = GithubUser.new(stub_omniauth)

      visit root_path
      # after I successfully log in,
      click_on "Profile"

      # I should see my profile pic,
      # expect(page).to have_css("img")
      # repositories with number,
      within(".repositories") do
        expect(page).to have_content("Repositories #{github_user.repository_count}")
      end
      # number of starred repos,
      within(".starred_repos") do
        expect(page).to have_content("Starred")
      end
      # followers, and
      within(".followers") do
        expect(page).to have_content("Followers #{github_user.number_of_followers}")
      end
      # following
      within(".following") do
        expect(page).to have_content("Following #{github_user.following_other_users_count}")
      end
    end
  end
end
